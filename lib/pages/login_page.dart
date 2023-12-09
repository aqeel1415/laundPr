import 'dart:convert';

import 'package:course/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_cli/dart_frog_cli.dart';

const baseUrl = 'http://localhost:8000';

class LoginPage extends StatelessWidget {
  final loginRoute = '$baseUrl/login';
  // final usernameController = TextEditingController(); we used a better way
  // final passwordController = TextEditingController();
  var username = '';
  var password = '';

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        // when open keyboard in mobile all appearing widgets will not be resized
        //so that they will appear hidden but this will cause problem when there is a there is a textfield at the bottom the keyboard
        //will show above the textfield
        // SingleChildScrollView( this for solving widgets the screen size acceeding ) but need to know  a specific height
        // so by using sizedBox, but size here is not fixed because we used spacer() inside
        // so using MediaQuery.of(context).size.height will give exact size of the used mobile for the SingleChildScrollView

        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // a variable MediaQuery.of(context).size.height gives the height equal to reseponding mobile used
                child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Spacer(), //it automatically expand to fill anyway level a space instead of sizedbox (not used ny other widegts)
                        Text(
                          'Laundelivery',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Login to continue',
                            style: TextStyle(color: Colors.white)),
                        Spacer(),
                        TextField(
                          //controller: usernameController, //we used better way is down
                         onChanged: (value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'username',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          // controller: passwordController, //we used better way is down
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: Text('Forget password?')),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 48,
                            width: double
                                .infinity, // infinity to fill all the vertical/horizantal space
                            child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).pushNamed('/home'); //this new page above the main and back button will close it
                                  Navigator.of(context).pushReplacementNamed('/main'); // replace whole page
                                  // Here where you check for user
                                  //doLogin();
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return HomePage();
                                  // }));
                                },
                                child: Text('Log in'))),
                        Spacer(),
                        Text('Or sign in with',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 48,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/imges/Google.png'),
                                      Text(' Login with Google'),
                                    ]))),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 48,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/imges/facebook.png'),
                                      Text(' Login with Facebook'),
                                    ]))),
                        Row(
                          children: [
                            Text("Don't have account?",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.amberAccent,
                                ),
                                child: Text('Sign up'))
                          ],
                        ) //row
                        ,
                        Spacer(),
                      ],
                    )))));
  }

  Future<String> doLogin() async {
    // final username = usernameController.text; //we used a better way
    // final password = passwordController.text;
    final body = {
      'username': username,
      'password': password,
    };
    final response =
        await http.post(Uri.parse(loginRoute), body: jsonEncode(body));
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print('You have error!');
      throw Exception('Error');
    }
  }
}
