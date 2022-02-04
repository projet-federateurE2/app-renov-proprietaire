import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class WorkSelectionEmptyDescription extends StatelessWidget {
  const WorkSelectionEmptyDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconBackgroundCircle = IconBackgroundCircle(
      imageSize:
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
              ? MediaQuery.of(context).size.width * 0.12
              : MediaQuery.of(context).size.height * 0.12,
      topCirclePosition: 10,
      rightCirclePosition: 10,
      url: "icons/house.svg",
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.height * 0.52,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 4,
                left: 10,
              ),
              child: iconBackgroundCircle,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 16,
                  bottom: 8,
                ),
                child: const AutoSizeText(
                  TextRenov.workProjectEmpty,
                  // textAlign: TextAlign.center,
                  maxLines: 5,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
