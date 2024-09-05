import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<int> quantities = [1, 1, 1]; // Initial quantities

  // Price
  List<double> prices = [51.0, 30.0, 43.0];

  //  images
  List<String> images = [
    'assets/images/t-shirt f.jpeg',
    'assets/images/t-shirt.jpeg',
    'assets/images/genji.jpeg'
  ];

  // Calculation for total amount
  double getTotalAmount() {
    double total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quantities.length,
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
                  child: Row(
                    children: [
                      Image.asset(
                        images[index],
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0 ? 'Pullover' : index == 1 ? 'T-Shirt' : 'Sport Dress',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Color: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: index == 0
                                        ? 'Black '
                                        : index == 1
                                        ? 'Gray '
                                        : 'Black ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Size: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: index == 0 || index == 1 ? 'L' : 'M',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, // Bold weight for the size
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove,),
                                  onPressed: () {
                                    setState(() {
                                      if (quantities[index] > 1) {
                                        quantities[index]--;
                                      }
                                    });
                                  },
                                  style: IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(.1)),
                                ),
                                Text(quantities[index].toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      quantities[index]++;
                                    });
                                  },
                                    style: IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(.1))
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                          Text('\$${(prices[index] * quantities[index]).toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )

                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total amount:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '\$${getTotalAmount().toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.redAccent

                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Congratulations on your purchase!'),
                        ),
                      );
                    },
                    child: Text(
                      'CHECK OUT',
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
