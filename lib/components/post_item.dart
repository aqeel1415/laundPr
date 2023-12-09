import 'package:course/styles/app_text.dart';
import 'package:flutter/widgets.dart';

class PostItem extends StatelessWidget{
  final String user;
  const PostItem({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
          children: [
            Image.asset(
              'assets/temp/user1.jpeg',
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 16,
            ),
            Text(user, style: AppText.subtitle3,),
          ],
            ),
         SizedBox(
              height: 12,
            ),
            Image.asset('assets/temp/washing.PNG'),
          SizedBox(
              height: 12,
            ),
            Text('This is a description for the laundry service', style: AppText.subtitle3)
        ],
      ),
    );
  }}