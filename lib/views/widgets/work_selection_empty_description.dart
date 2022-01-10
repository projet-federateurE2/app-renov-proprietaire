import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class WorkSelectionEmptyDescription extends StatelessWidget {
  const WorkSelectionEmptyDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconBackgroundCircle = const IconBackgroundCircle(
        imageSize: 200,
        topCirclePosition: 30,
        rightCirclePosition: 60,
        url: "icons/house.svg");

    return SizedBox(
      width: 488,
      height: 448,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(
                    bottom: 20, left: (iconBackgroundCircle.imageSize * 0.35)),
                child: iconBackgroundCircle),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const Text(
                  TextRenov.descriptionWorkSelectionEmpty,
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
