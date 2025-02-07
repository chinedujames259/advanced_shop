import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController titleCtr =TextEditingController();
  GlobalKey<FormState>_formkey =GlobalKey<FormState>();
  TextEditingController priceCtr = TextEditingController();
   TextEditingController descriptionCtr = TextEditingController();

   Uint8List? picked_image;
   FirebaseFirestore firestore = FirebaseFirestore.instance;

   void pickedImage()async{
    Uint8List? photo = await ImagePickerWeb.getImageAsBytes();
    picked_image = photo;
    setState(() {
      
    });
   }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text("New Post"),),
    body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(10),
        child: Card(child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: titleCtr,
                  validator:(value){
                    if(value!.isEmpty){
                      return "Title is empty";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: priceCtr,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Price is empty";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
               Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: descriptionCtr,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Description is empty";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              Container(width: size.width,
              height: 100,
              color: Colors.grey,
              child: InkWell(
                onTap: () {
                  pickedImage();
                },
                child: picked_image ==null?
                Card(child: Center(child: Icon(Icons.image_outlined),),):
                Image.memory(picked_image!)
              ),),

              SizedBox(height: 20,),
              Container(
                width: size.width,
                child: MaterialButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                    if(picked_image != null){
                      firestore.collection("advanced_shop_products").add({
                        "price":priceCtr.text,
                        "description":descriptionCtr.text,
                        "image":"image",
                        "title":titleCtr.text,
                        "user_id":FirebaseAuth.instance.currentUser!.uid
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfuly posted")));

                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please pick an image")));
                    }
                  }
                  },child: Text("Submit"),color: Colors.blueAccent,textColor: Colors.white,
                  ),
              )
            ],)),
        ),),
      ),
    ),
    ));
  }
}