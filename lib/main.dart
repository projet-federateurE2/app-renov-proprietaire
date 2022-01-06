import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App renov',
      theme: ThemeData(
          fontFamily: 'Poppins'
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Center(
        child:IconBackgroundCircle(imageSize: 100, url:'icons/house.svg', topCirclePosition: 25, rightCirclePosition: 25,),
      ),
      );
  }
}
