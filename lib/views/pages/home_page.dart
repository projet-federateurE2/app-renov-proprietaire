import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/left_side_bar.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:renov_proprietaire_app/views/widgets/work_in_progress_block.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var workInProgress = [0, 1, 2, 3];

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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PageTitle(text: TextRenov.workInProgress),
                            const Text(TextRenov.homePageDesc),
                            CarouselSlider.builder(
                                options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: false,
                                    viewportFraction: 1,
                                    height: 200.0),
                                itemCount: (workInProgress.length / 2).round(),
                                itemBuilder: (context, index, realIndex) {
                                  final int first = index * 2;
                                  final int? second = index * 2< (workInProgress.length / 2).round() - 1 ? first + 1 : null;
                                  return Row(
                                    children: [first, second].map((idx) {
                                      return idx != null
                                      ? WorkInProgressBlock(
                                          urlIcon: "urlIcon",
                                          workTitle: "workTitle",
                                          budget: "budget",
                                          financialAssistance:
                                              "financialAssistance",
                                          stepInProgress:
                                              "stepInProgress")
                                              : Container();
                                    }).toList(),
                                  );
                                }),   
                          ],
                        ),
                      ),
                      Container(
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
