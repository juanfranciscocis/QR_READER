import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR READER',
      initialRoute: '/home',
      routes:{
        '/home': (context) => HomeScreen(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}