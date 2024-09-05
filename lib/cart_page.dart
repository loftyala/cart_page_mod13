/*
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
//images
  final List<String> images = [
    'assets/images/t-shirt f.jpeg', // Replace with actual URLs or asset paths
    'assets/images/t-shirt.jpeg',
    'assets/images/genji.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: Image.asset(
                images[index],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Item description goes here.'),
              trailing: Icon(Icons.delete),
              onTap: () {

              },
            ),
          );
        },
      ),
    );
  }
}
*/
