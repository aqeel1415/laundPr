import 'package:course/models/shop.dart';
import 'package:course/pages/cart_page.dart';
import 'package:course/pages/home_page.dart';
import 'package:course/pages/main_page.dart';
import 'package:course/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:course/pages/login_page.dart';
import 'package:course/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
   ChangeNotifierProvider(create: (context) => Shop(),
   child : MyApp(),
   ),
   );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,      
          
          ),
      //home: LoginPage(), now we will use somthing called Initial routes for faster navigations 
      initialRoute: '/', //so now / is login page as below and in other pages we will use pushNamed() instead of Push()
      routes: {
        '/' :(context) => LoginPage(),
        '/home' :(context)=> HomePage(),
        '/main' :(context)=> MainPage(),
        '/cart_page' :(context)=> CartPage(),
        '/shop_page' :(context)=> ShopPage(),
        },
    );
  }
}
