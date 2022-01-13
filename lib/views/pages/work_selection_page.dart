import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_description.dart';
import 'package:renov_proprietaire_app/views/widgets/work_clickable_block.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_empty_description.dart';


class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  var workname1 = "hihi";

  callback(newAbc) {
    setState(() {
      workname1 = newAbc;
    });
  }

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
                    tag: "title-select-work",
                    child: Material(
                        type: MaterialType.transparency, // likely needed
                        child: PageTitle(text: "Travaux d'isolation"))),
                SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: GridView.count(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                WorkClickableBlock(
                                  urlImage: './../../../assets/icons/floor.svg',
                                  workName: workname1,
                                  callback: callback,
                                ),
                                WorkClickableBlock(
                                    urlImage:
                                        './../../../assets/icons/floor.svg',
                                    workName: 'ffeffffe',
                                    callback: callback),
                                WorkClickableBlock(
                                    urlImage:
                                        './../../../assets/icons/floor.svg',
                                    workName: 'ffeffffe',
                                    callback: callback),
                                WorkClickableBlock(
                                    urlImage:
                                        './../../../assets/icons/floor.svg',
                                    workName: 'ffeffffe',
                                    callback: callback),
                                WorkClickableBlock(
                                    urlImage:
                                        './../../../assets/icons/floor.svg',
                                    workName: 'ffeffffe',
                                    callback: callback),
                                WorkClickableBlock(
                                    urlImage:
                                        './../../../assets/icons/floor.svg',
                                    workName: 'ffeffffe',
                                    callback: callback)
                              ])),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: const [WorkSelectionEmptyDescription()],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
