import 'package:course/pages/home_page.dart';
import 'package:course/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}
  class _MainPage extends State<MainPage>{
    int curIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    body: pages[curIndex],
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: 'message'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
      // BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/laundryDelivery.svg'), label: 'favorite'),
    ],
    currentIndex: curIndex, // giving value for the start index to be 0  
    onTap: (index){ // when pressed the index increase by one and qw store the value in curIndex
      setState(() {
        curIndex = index; 
      });
    },
    type: BottomNavigationBarType.fixed,
    showSelectedLabels:  false,
    showUnselectedLabels:  false,
    ),

    );
  }
  
  final pages = [
    HomePage(),
    ShopPage(),
    Center(child: Text('favorite')),
    Center(child: Text('messages')),
    Center(child: Text('Settings')),    
     ];
  
  }