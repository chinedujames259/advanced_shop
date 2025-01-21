import 'package:flutter/material.dart';
import 'package:online_store/pages/first_view_page.dart';
import 'package:online_store/pages/signup_page.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var formKey = GlobalKey<FormState>();
   var emailCrt = TextEditingController();
  var passwordCrt = TextEditingController();
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
                          "Account Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
          
                        // email textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller:emailCrt ,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Email",
                                labelText: "Email",
                                prefixIcon:Icon(Icons.email),
                                prefixIconColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
          
                        const SizedBox(height: 10),
          
                        // password textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                prefixIconColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
          
                        // Sign up button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child:  GestureDetector(
                            onTap: (){
                              if(formKey.currentState!.validate()){}
                            //        Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const FirstViewPage(),
                            //   ),
                            // );
                              
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  "Log in",
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: (){
                                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
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
                                  "Sign up",
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}