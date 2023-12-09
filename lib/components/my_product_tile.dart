import 'package:course/models/product.dart';
import 'package:course/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //let the text appears in left side of the box
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //trick tp push th price at the bottm as all above compnent in one column
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1, //means square
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: const Icon(Icons.favorite),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //product name
              Text(product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              //product description
              Text(product.description, style: TextStyle()),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ '+product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(12)),
                child: IconButton(onPressed:() => addToCart(context), 
                icon: const Icon(Icons.add)),
              )
            ],
          ),
        ],
      ),
    );
  }
  
  void addToCart(BuildContext context) {
    showDialog(context: context, builder: (context)=>
    AlertDialog(
      content: const Text("Add this item to the cart ?"),
    actions: [
      MaterialButton(onPressed: ()=> Navigator.pop(context),
      child: const Text("Cancel",)),

    MaterialButton(onPressed: (){
      Navigator.pop(context);

      context.read<Shop>().addToCart(product);
    }
      ,child: const Text("Yes",))
    ]    
    ),);
  }
}
