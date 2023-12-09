import 'package:course/components/post_item.dart';
import 'package:course/styles/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  List<String> users = [];

  @override
  Widget build(BuildContext context) {
     mockUsersFromServer();
    return Scaffold(
        appBar: AppBar(
          // This widget already implements preferedSizeWidegt which appBar should take
          title: Text('Laundelivery'),
          centerTitle: true,
          actions: [
            Icon(Icons.location_disabled_outlined),
          ],
        ),
        // body: SingleChildScrollView( // not well scrolled smoothly 
        //   child: Column(
        //     children: mockUsersFromServer(),
        //   ),
        // )
       //  body: ListView( children: mockUsersFromServer(),), // we want a better feature in list  view called builder in order to arrage the item more better
        //  body: ListView.separated(
        //   itemBuilder: (context, index){
        //   return PostItem(user: users[index]);
        //  }, separatorBuilder: (BuildContext context, int index) {
        //   return SizedBox(height: 20,);
        //    }, itemCount: users.length,)
        );
  }



 mockUsersFromServer() {
  for (var i = 0; i < 100; i++) {
    users.add('user number $i');
  }
  return users;
}
}