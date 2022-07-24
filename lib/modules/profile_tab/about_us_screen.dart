import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome To Nomadic Florist!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nomadic Florist is a Professional Flower Shop Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Flower Shop, with a focus on dependability and Online Payment, On Time Delivery, Fresh and Beautiful flowers. We're working to turn our passion for Flower Shop into a booming online website. We hope you enjoy our Flower Shop as much as we enjoy offering them to you.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "I will keep bringing new flowers on my app for all of you. Please give your support and love.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Thanks For Visiting My App", textAlign: TextAlign.center),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Have a nice day !",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
