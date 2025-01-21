import 'package:flutter/material.dart';
import 'package:online_store/pages/first_view_page.dart';
import 'package:online_store/pages/signin_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // var formKey = GlobalKey();
   var formKey = GlobalKey<FormState>();
  var nameCrt = TextEditingController();
  var passwordCrt = TextEditingController();
  var emailCrt = TextEditingController();

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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                             controller: nameCrt,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Name",
                              labelText: "Name",
                              prefixIcon: Icon(Icons.person),
                             
                            ),
                            validator: (val) {
                              if (val == null || val.trim().length < 8) {
                                return "Name is short";
                              }
                              return null;
                            },
                            ),
                          ),
                        ),
          
                        const SizedBox(height: 10),
          
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
                            controller: emailCrt,
                            decoration:const InputDecoration(
                              border:InputBorder.none,
                              hintText: "Enter email",
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                            ),
                            validator: (val) {
                              if (val == null || val.trim().length < 8) {
                                return "Invalid Email";
                              }
                              return null;
                            },
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
                            child: TextFormField(
                            obscureText: true,
                            controller: passwordCrt,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              
                            ),
                            validator: (val) {
                              if (val == null || val.trim().length < 8) {
                                return "At least 8";
                              }
                              return null;
                            },
                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
          
                        // Sign up button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: () {
                            //   if(formKey.currentState!.validate()){}
                            //    Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>const FirstViewPage (),
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: (){
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
