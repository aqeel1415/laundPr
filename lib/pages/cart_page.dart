import 'package:course/models/product.dart';
import 'package:course/models/shop.dart';
import 'package:course/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cart Page'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
        //cart list
        Expanded(            
          child: cart.isEmpty ? Align(child: const Text('Your cart is empty.')) 
          : ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {

          //get indiviual item in cart
          final item = cart[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.price.toStringAsFixed(2)),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => removeItemFromCart(context, item),
            ),
          );
        })
        )

        //pay button

        ,Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(onPressed: () =>payButtonPressed(context), child: const Text('Send Delivery Request')),
          ),
        )
      ]),
    );
  }

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Remove this item to the cart ?"),
          actions: [
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                )),
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  context.read<Shop>().removeFromCart(product);
                },
                child: const Text(
                  "Yes",
                ))
          ]),
    );
  }

    void payButtonPressed(BuildContext context) {
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          content: Text('The Laundry Request Sent!'),
        ));
    
  }
}
