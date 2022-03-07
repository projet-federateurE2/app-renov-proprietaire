import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/left_side_bar.dart';
import 'package:renov_proprietaire_app/views/widgets/notepad.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/work_in_progress_block.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> works = [
      {
        'urlIcon': 'icons/window.svg',
        'workTitle': 'Isolation des fenêtres',
        'budget': 'Non renseigné',
        'financialAssistance': 'Non renseigné',
        'stepInProgress': 'Trouver un artisan dans la liste',
        'percentageCompleted': 0
      },
      {
        'urlIcon': 'icons/attic.svg',
        'workTitle': 'Isolation des combles',
        'budget': 'Non renseigné',
        'financialAssistance': 'Non renseigné',
        'stepInProgress': 'Trouver un artisan dans la liste',
        'percentageCompleted': 20
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const LeftSideBar(),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PageTitle(text: TextRenov.workInProgress),
                            const Text(TextRenov.homePageDesc),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: works.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var _workInProgress = works[index];
                                    return WorkInProgressBlock(
                                        urlIcon: _workInProgress['urlIcon'],
                                        workTitle: _workInProgress['workTitle'],
                                        budget: _workInProgress['budget'],
                                        financialAssistance: _workInProgress['financialAssistance'],
                                        stepInProgress: _workInProgress['stepInProgress'],
                                        percentageCompleted: _workInProgress['percentageCompleted'],
                                        );
                                  }),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: const Notepad(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
