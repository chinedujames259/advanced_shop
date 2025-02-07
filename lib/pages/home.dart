//import 'package:flutter/foundation.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_store/pages/product_details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: CarouselSlider(
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/Convert-Your-Image-Into-GIF.webp",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/realistic-image.webp",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/gamer-5979004_1280.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/panther-7600667_1280.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  // setState(() {});
                },
              ),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("advanced_shop_products")
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("An error occured"),
                    );
                  }
                  List products = snapshot.data!.docs;
                  return GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (ctr, index) {
                        return InkWell(
                          onTap: () {
                            var product = {
                              "title": products[index]['title'],
                              "price": products[index]['price'],
                              "description": products[index]['description'],
                            };
                            var route = MaterialPageRoute(
                                builder: (context) => ProductDetails(product: product,));
                            Navigator.push(context, route);
                          },
                          child: Container(
                            child: Card(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.asset(
                                              "assets/9huvf9.webp",
                                              fit: BoxFit.fill),
                                        ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(products[index]['title']),
                                                Text(products[index]['price']),
                                                MaterialButton(
                                                  onPressed: () {},
                                                  child: Text("Buy Now"),
                                                  textColor: Colors.white,
                                                  color: Colors.blue,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
