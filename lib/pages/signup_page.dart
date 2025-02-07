import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_store/pages/first_view_page.dart';
import 'package:online_store/pages/signin_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
   
  // var formKey = GlobalKey();
  var formKey = GlobalKey<FormState>();
  var nameCrt = TextEditingController();
  var passwordCrt = TextEditingController();
  var emailCrt = TextEditingController();

   String error_message = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(
        //color: Colors.blueAccent,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                    "lib/images/Login-PNG-Free-Image.png",
                    width: size.width,
                    height: size.height,
                  ),
                  
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
             Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          children: [
                            const Text(
                              "Create An Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blueAccent),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            // Name textfield
                
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: TextFormField(
                                  controller: nameCrt,
                                  decoration: InputDecoration(
                                    hintText: "Enter Name",
                                    labelText: "Name",
                                    //labelStyle:const TextStyle(color: Colors.blue),
                                    prefixIcon: const Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Enter your name";
                                    }
                                    if (val.trim().length < 3) {
                                      return "Name must be at least 3 characters";
                                    }
                                    if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(val)) {
                                      return "Name must only contain letters and spaces";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                
                            const SizedBox(height: 10),
                
                            // email textfield
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: TextFormField(
                                  controller: emailCrt,
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    labelText: "Email",
                                    //labelStyle:const TextStyle(color: Colors.blue),
                                    prefixIcon: const Icon(Icons.email),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Enter email";
                                    }
                                    String pattern =
                                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                                    if (!RegExp(pattern).hasMatch(val)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                
                            const SizedBox(height: 10),
                
                            // password textfield
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: TextFormField(
                                  controller: passwordCrt,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password",
                                    //labelStyle:const TextStyle(color: Colors.blue),
                                    prefixIcon: const Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return "Enter password";
                                    }
                                    if (val.trim().length < 8) {
                                      return "Password must be at least 8 characters";
                                    }
                                    if (!RegExp(
                                            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                                        .hasMatch(val)) {
                                      return "Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                             Visibility(
                          visible: error_message.isNotEmpty,
                          child: Text(error_message),
                        ),
                        Visibility(
                          visible: isLoading,
                          child: const CircularProgressIndicator(),
                        ),
                
                            // Sign up button
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: GestureDetector(
                                onTap: () async{
                                  if (formKey.currentState!.validate()) {
                                    isLoading =true;
                                    setState(() {});

                                    try{
                                      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(email: emailCrt.text, password: passwordCrt.text);
                                      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                                        
                                     await firebaseFirestore
                                     .collection("advance_store_users")
                                     .doc(user.user!.uid)
                                     .set({
                                        "name":nameCrt.text,
                                        "email":emailCrt.text,
                                        "password":passwordCrt.text,
                                        "user_type":"user"
                                      });
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(e)=> const FirstViewPage()));

                                    }on FirebaseAuthException catch (e){
                                      isLoading=false;
                                      error_message=e.message!;
                                      setState(() {});
                                    }
                                  }

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                
                            const SizedBox(
                              height: 17,
                            ),
                
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signin(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    // color: Colors.,
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
              
            ],
          ),
        ),
      ),
    );
  }
}
