import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';
import 'package:renov_proprietaire_app/views/widgets/work_type_clickable_block.dart';

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
      body: Row(
        children:[
          WorkTypeClickableBlock(workTypeDescription: 'Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été.' , iconSize:70, iconUrl:'icons/house.svg', workTypeTitle: 'Isolation'),
        WorkTypeClickableBlock(workTypeDescription: 'This iPour faire des économies d’énergie, et améliorer votre confort en hiver comme en été. ', iconSize:70, iconUrl:'icons/ventilation.svg', workTypeTitle: 'Isolation'),

        WorkTypeClickableBlock(workTypeDescription: 'Thishkbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb is a descrption of a block blablabalab', iconSize:70, iconUrl:'icons/heating.svg', workTypeTitle: 'Isolation'),


        ],
      ),
      );
  }
}
