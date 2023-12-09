import 'package:course/models/shop.dart';
import 'package:course/components/my_drawer.dart';
import 'package:course/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Laundry Services'),
          centerTitle: true,
          actions: [//go to the cart
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/cart_page'), icon: const Icon(Icons.add_shopping_cart_outlined) )],
        ),
        backgroundColor: Colors.white,
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            SizedBox(height: 25),
            //shop title
            Center(child: Text('Laundry category')),

            //shop subtitle

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    //get each product from the shop
                    final product = products[index];
                    ////return as a product tile UI
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
