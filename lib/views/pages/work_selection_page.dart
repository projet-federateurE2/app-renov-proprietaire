import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_empty_description.dart';

class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  @override
  Widget build(BuildContext context) {
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
                Center(child: WorkSelectionEmptyDescription())
              ],
            ),
          ),
        ]));
  }
}
