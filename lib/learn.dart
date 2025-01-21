import 'package:flutter/material.dart';

class FormTutorial extends StatefulWidget {
  const FormTutorial({super.key});

  @override
  State<FormTutorial> createState() => _FormTutorialState();
}

class _FormTutorialState extends State<FormTutorial> {
  var formKey = GlobalKey<FormState>();
  String username = "";
  TextEditingController usernameCtr = TextEditingController();
  var userErr = "";


  List<String> states = [
    "Enugu",
    "Kaduna",
    "Jos",
    "Benue",
    "Abuja",
    "Nasarawa",
    "Bauchi"
  ];
  var initialValue;
  int groupValue = 0;
  bool likeFootball = false;
   bool likeRice = false;

  @override
  void initState(){
    usernameCtr.text = "I am a beautiful lady";
    initialValue = states[0];

    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        title: const Text("Form Class"),
      ), // AppBar
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: const Text("Username"),
                hintText: "Enter username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)),
                prefixIcon: const Icon(Icons.lock),
                prefix: const Text("\$"),
                suffixIcon: const Icon(Icons.visibility_off),
                suffix: const Text("N")),
              onChanged: (text) {
                if (text.length == 3) {
                  if(text == "100") {
                    ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("it is 100")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("This thing no be 100")));
                  }
                }
                },
                 validator: (value) {
                  if(value!.isEmpty) {
                      return "This field is Empty";
                }

                if (value.length < 3) {
                  return "please write a longer username";
                }
                return null;

              },
                 onSaved: (value) {
                username = value!;
              },
              ),
               
            ),
            const SizedBox(
                height: 20,
            ), // SizedBox
            Container(
              //margin: EdgeInsets.only(top:20),
              child: Card(
                elevation: 5.0,
                child: TextFormField(
                  controller: usernameCtr,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(225, 228, 222, 22),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12))),
              ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 218, 215, 215)),
                borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                value: initialValue,
                isExpanded: true,
                elevation: 0,
                underline: Container(),
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                items: states.map((state) {
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (value) {
                  initialValue = value.toString();
                  setState( () {});
                },
                )
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Text("Male"),
                title: Radio(
                  groupValue: groupValue,
                  value: 0,
                  onChanged: (value) {
                    groupValue = 0;
                    setState(() {});
                  },
                  ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Text("Female"),
                title: Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    groupValue = 1;
                    setState(() {});
                  },
                  ),
              ),
            ),
            const Divider(),
            const Center(child: Text("HOBBY"),),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Text("FootBall"),
                title: Checkbox(
                  value: likeFootball, 
                  onChanged: (value) {
                    likeFootball = value!;
                    setState (()  {});
                  },
                  )),// CheckBox // ListTile
            ), // Container
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Text("Rice"),
                title: Checkbox(
                  value: likeRice, 
                  shape:const StadiumBorder(),
                  checkColor: Colors.red,
                  onChanged: (value) {
                    likeRice = value!;
                    setState(()  {});
                  },
                  )), // Checkbox  // ListTile
            ), // Container
            const Divider(),


            const TextField(),
            TextFormField(
              minLines: 5,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: "About yourself",
                border: OutlineInputBorder()), // ImputDecoration
            ), // TextFormField

            Text(
              userErr,
              style: const TextStyle(color: Colors.red),
            ), // Text
            MaterialButton (
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ////
                  formKey.currentState!.save();

                  if(usernameCtr.text.trim().length > 3) {
                    setState (() {
                      userErr = "";
                    });
                  }
    
                  print(username);
                }
              },
              textColor: Colors.white,
              color: Colors.red,
              child: const Text(
                "Submit Form",
                style: TextStyle(fontFamily: "san-serif"),
              ), // Text
              ), // MaterialButton
            ],

      ),
      ),
        ),
      ),
        );
      }
      }