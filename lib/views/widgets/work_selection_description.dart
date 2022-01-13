import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';

import 'icon_background_circle.dart';

class WorkSelectionDescription extends StatefulWidget {
  final String titleDesc;
  final String urlImage;
  final String stringDesc1;
  final String stringDesc2;
  const WorkSelectionDescription(
      {Key? key,
      required this.titleDesc,
      required this.urlImage,
      required this.stringDesc1,
      required this.stringDesc2})
      : super(key: key);

  @override
  State<WorkSelectionDescription> createState() => _WorkSelectionDescription();
}

class _WorkSelectionDescription extends State<WorkSelectionDescription> {
  var isPressed = false;
  Color color = ColorsRenov.primaryGreen;
  String textButton = "+ Ajouter ce travaux";

  @override
  Widget build(BuildContext context) {
    var iconBackgroundCircle = IconBackgroundCircle(
        imageSize: 120,
        topCirclePosition: 15,
        rightCirclePosition: 15,
        url: widget.urlImage);

    void changeColor() {
      setState(() {
        isPressed = !isPressed;
        if (!isPressed) {
          color = ColorsRenov.primaryGreen;
          textButton = "+ Ajouter ce travaux";
        } else {
          color = Colors.red;
          textButton = "- Retirer ce travaux";
        }
      });
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.44,
      height: MediaQuery.of(context).size.height * 0.68,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 24),
                child: PageTitle(text: widget.titleDesc)),
            Container(
                margin: const EdgeInsets.only(
                  top: 12,
                  bottom: 48,
                  left: 15,
                ),
                child: iconBackgroundCircle),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                    child: SvgPicture.asset(
                      'icons/bulb.svg',
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 32),
                        child: Text(
                          widget.stringDesc1,
                          // textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 17.0),
                        )))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: SvgPicture.asset(
                      'icons/warning.svg',
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Container(
                        child: Text(
                      widget.stringDesc2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 17.0),
                    )))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 16, right: 32),
                    child: TextButton(
                        onPressed: () {
                          changeColor();
                        },
                        child: Text(textButton,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: color,
                            )),
                        style: TextButton.styleFrom()))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
