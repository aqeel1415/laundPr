import 'package:course/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    backgroundColor: Theme.of(context).colorScheme.background,
    child: Column(
      
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
       //drawer header: logo
      Column(
        children: [
          DrawerHeader(child: 
          Center(
            child: Icon(Icons.shopping_bag,size: 82,
            color: Theme.of(context).colorScheme.inversePrimary,
            ))),
          
            const SizedBox(height:25),
          
          
          //shop tile
          MyListTile(
            text: "Shop",
            icon: Icons.home,
            onTap: () {           

              //pop drawer first 
              Navigator.pop(context);

              //go to the shop
              Navigator.pushNamed(context, '/shop_page');
            }
          ),
          
          MyListTile(
            text: "Cart",
            icon: Icons.shopping_cart,
            onTap: (){

              //pop drawer first 
              Navigator.pop(context);
              
              //go to the cart
              Navigator.pushNamed(context, '/cart_page');


            },
          ),
        ],
      ),

      Padding(
        padding: const EdgeInsets.only(bottom:25.0),
        child: MyListTile(
          text: "Exit",
          icon: Icons.logout,
          onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false),
        ),
      ),

      //cart tile

      //exit
    ]),);
  }
}
