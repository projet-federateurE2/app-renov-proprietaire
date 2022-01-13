import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_description.dart';

class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  @override
  Widget build(BuildContext context) {
    var a =
        "L’isolant doit être posé entre un espace chauffé et un espace non chauffé.";
    var b = "Un isolant sans marquage CE n’est pas éligible !";
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: "title",
                    child: Material(
                        type: MaterialType.transparency, // likely needed
                        child: PageTitle(text: "Travaux d'isolation"))),
                Center(
                    child: WorkSelectionDescription(
                        titleDesc: "Isolation des combles",
                        urlImage: "icons/floor.svg",
                        stringDesc1: a,
                        stringDesc2: b))
              ],
            ),
          ),
        ]));
  }
}
