import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

import 'icon_background_circle.dart';

class WorkInProgressBlock extends StatelessWidget {
  final String urlIcon;
  final String workTitle;
  final String budget;
  final String financialAssistance;
  final String stepInProgress;

  const WorkInProgressBlock(
      {Key? key,
      required this.urlIcon,
      required this.workTitle,
      required this.budget,
      required this.financialAssistance,
      required this.stepInProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: 320.0,
            height: 200.0,
            child: Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(13.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                    onTap: () {},
                    child: Padding(
                        // Even Padding On All Sides
                        padding: const EdgeInsets.only(
                            left: 20, right: 0, top: 15, bottom: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: IconBackgroundCircle(
                                          url: urlIcon,
                                          imageSize: 55,
                                          rightCirclePosition: 15,
                                          topCirclePosition: 15)),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          child: Text(workTitle,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.w600))),
                                      Row(children: [
                                        const Text('Budget : ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500)),
                                        Text(budget.toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300))
                                      ]),
                                      Row(children: [
                                        const Text('Aides visées : ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500)),
                                        Text(financialAssistance.toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300))
                                      ])
                                    ],
                                  )),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text('Etape en cours :',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500))),
                                  Text(stepInProgress,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300)),
                                  FractionallySizedBox(
                                    // taille de la bar et du texte "complété à..%" qui s'adapte automatiquement
                                    widthFactor: 0.8,
                                    alignment: FractionalOffset.centerLeft,

                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LinearPercentIndicator(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          lineHeight: 8.0,
                                          percent: 0.1,
                                          backgroundColor:
                                              ColorsRenov.secondaryGreen,
                                          progressColor:
                                              ColorsRenov.primaryGreen,
                                        ),
                                        Text('Complété à 0 %',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ]))))),
        Positioned(
          bottom: 0,
          right: 0,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
                width: 35,
                height: 35,
                child: Stack(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    )),
                    InkWell(
                      onTap: () {
                        // New Widget Page
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: SvgPicture.asset('icons/arrowCircle.svg',
                          color: ColorsRenov.primaryGreen),
                    )
                  ],
                ));
          }),
        ),
      ],
    );
  }
}
