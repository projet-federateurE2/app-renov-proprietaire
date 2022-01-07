import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class WorkTypeClickableBlock extends StatelessWidget {
  final String iconUrl;
  final double iconSize;
  final String workTypeTitle;
  final String workTypeDescription;

// final Widget page

  const WorkTypeClickableBlock({
    Key? key,
    required this.iconUrl,
    required this.iconSize,
    required this.workTypeTitle,
    required this.workTypeDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconCirclePositionTop = 15.0;
    var iconCirclePositionRight = 15.0;
    // 353 246
    return SizedBox(
      width: 353.0,
      height: 246.0,
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: 10, left: ((iconSize * 0.3))),
                      child: IconBackgroundCircle(
                          url: iconUrl,
                          imageSize: iconSize,
                          rightCirclePosition: iconCirclePositionRight,
                          topCirclePosition: iconCirclePositionTop)),
                  Text(
                    workTypeTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 27.0),
                  ),
                  Text(
                    workTypeDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 17.0),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
