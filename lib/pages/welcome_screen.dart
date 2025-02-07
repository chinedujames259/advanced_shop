import 'package:flutter/material.dart';
import 'package:online_store/pages/signin_page.dart';
import 'package:online_store/pages/signup_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
              flex: 3,
              child:  Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    
                    child: Image.asset("lib/images/Login-PNG-Free-Image.png"),
                  ),
                  // Container(
                  //   child: Text("Hello Welcome"),
                  // )
                ],
              ),
              ),
               Expanded(
              flex: 2,
             child:Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  // padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome to Advance stores",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10,left: 60),
                          child: const Text(
                            "Here at advance we give the best of everything tech laptops,phones,desktop setups and many more",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(400, 50), // width, height
                            ),
                            child: const Text('Sign Up'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(400, 50),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            child: const Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signin(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ),
              //Expanded(child: Column())
            ],
          ),
        ),
      ),
    );
  }
}
