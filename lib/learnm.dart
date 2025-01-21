import 'package:flutter/material.dart';

class FormPractical extends StatefulWidget{
  const FormPractical({super.key});

  @override
  State<FormPractical> createState() => _FormPracticalState();
}

class _FormPracticalState extends State<FormPractical> {
  var mailCrt = TextEditingController();
  var passwordCrt = TextEditingController();
  List countries = ["Nigeria"];
  var selectedCountry = "Nigeria";
  var formKey = GlobalKey<FormState>();
  
  get emailCrt => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 218, 218),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 180,
              width: size.width,
              color: Colors.blueAccent,
              child: const Center(
              child: Text(
                "BEAMAX TECH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 150),
              width: size.width,
              height: 500,
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: emailCrt,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                            validator: (val) {
                              if(val!.trim().length < 3) {
                                return "Invaild Email";
                              }
                              return null;
                             },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox.shrink(),
                            value: selectedCountry,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            borderRadius: BorderRadius.circular(12),
                            items: countries.map((country) {
                              return DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              );
                              }).toList(),
                              onChanged: (val) {
                                selectedCountry = val.toString();
                                setState(() {});
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            controller: mailCrt,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                                validator: (val) {
                                  if(val!.trim().length < 3) {
                                    return "Password too short";
                                  }
                                  return null;
                                },
                          ),
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          height: 40,
                          width: size.width,
                          child: MaterialButton(
                            onPressed: (){},
                            textColor: Colors.white,
                            color: Colors.blueAccent, child: const Text("Sign up"),),
                        ),
                      ],
                    ),
                    ),
                ),
              ),
            ),
          ], 
        ),
      ),
    );
  }
}