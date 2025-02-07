import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_store/pages/first_view_page.dart';
import 'package:online_store/pages/signup_page.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();
  var emailCrt = TextEditingController();
  var passwordCrt = TextEditingController();

  String error_message = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // const Text("Welcome back"),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blueAccent,
                  child: Image.asset(
                    "lib/images/Login-PNG-Free-Image.png",
                    width: size.width,
                    height: size.height,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: SingleChildScrollView(
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

                          // email textformfield

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              child: TextFormField(
                                controller: emailCrt,
                                decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  labelText: "Email",
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

                          // password textformfield
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
                            visible: isLoading == true,
                            child: CircularProgressIndicator(),
                          ),

                          // Log in button
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});

                                  try {
                                    FirebaseAuth firebaseAuth =
                                        FirebaseAuth.instance;

                                    UserCredential user = await firebaseAuth
                                        .signInWithEmailAndPassword(
                                            email: emailCrt.text,
                                            password: passwordCrt.text);

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) =>
                                                const FirstViewPage()));
                                  } on FirebaseAuthException catch (e) {
                                    isLoading = false;
                                    error_message = e.message!;
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: () {
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
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
