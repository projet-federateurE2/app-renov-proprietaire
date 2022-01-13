import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
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
  var sizeScreen = 0.0;
  var numberColumns;
  var isBtnEnabled = false;

  callback(newAbc) {
    setState(() {
      workname1 = newAbc;
    });
  }
  onPressed(){
    setState(() {
      isBtnEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size.width;
    if (sizeScreen > 1500){
      numberColumns = 3;
    } else {
      numberColumns = 2;
    }

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
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: GridView.count(
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 20.0,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: numberColumns,
                              //shrinkWrap: true,
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
                          children: [WorkSelectionEmptyDescription(),
                          GreenButton(text: "coucou", onPressed: onPressed, enabled: isBtnEnabled)
                          ],
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
