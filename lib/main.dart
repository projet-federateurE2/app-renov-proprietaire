import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/pages/work_type_selection_page.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App renov',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const WorkTypeSelectionPage(),
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [const BackgroundGreenWave(), Container()],
      ),
    );
  }
}
