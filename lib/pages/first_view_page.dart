import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_store/pages/home.dart';
import 'package:online_store/pages/new_post.dart';
import 'package:online_store/pages/orders.dart';
import 'package:online_store/pages/profile.dart';

class FirstViewPage extends StatefulWidget {
  const FirstViewPage({super.key});

  @override
  State<FirstViewPage> createState() => _FirstViewPageState();
}

class _FirstViewPageState extends State<FirstViewPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Map user = {"name": "", "email": "", "user_type": ""};
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final User? authUser = firebaseAuth.currentUser;
    if (authUser != null) {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await firebaseFirestore
              .collection("advance_store_users")
              .doc(authUser.uid)
              .get();
      final Map<String, dynamic>? userData = userSnapshot.data();
      if (userData != null) {
      
        user = userData;
        setState(() {});
            

      }else{
        print("lllllllllllllllllllllll");

      }
    }
    // else{
    //   print("UUUUUUUUUUUUUUUUUUUUUUUU");
    // }
  }

  List pages = [Home(), Orders(), Profile()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: const Text("Welcome to Advanced shop"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 165,
                    color: Colors.blueAccent,
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(user['name']),
                    ),
                  )),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: user['user_type'] == "admin",
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
            var route = MaterialPageRoute(builder: (context) => NewPost());
            Navigator.push(context, route);
          },child: const Icon(Icons.add,color: Colors.white,),),
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
