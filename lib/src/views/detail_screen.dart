import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
        }, icon: Icon(Icons.shopping_bag_outlined))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 260, child: Image.asset(watchImage)),
              const ListTile(
                title: Text('Smart Watch'),
                subtitle: Text(
                  'Uni Sex',
                  style: TextStyle(color: Color(0xff9A9998)),
                ),
                trailing: Text(
                  "\$350.00",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffAA14F0)),
                ),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Colors",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffAA14F0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff23A4F7),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff363431),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff9A9998),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("About",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addItem(
                        'productId',
                        56,
                        'Smart Watch',
                        watchImage);
                    },
                    child: const Text("ADD TO CART",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffAA14F0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
