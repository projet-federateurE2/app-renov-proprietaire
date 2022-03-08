import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class ProjectSideButton extends StatefulWidget {

  final String text;
  final String urlIcon;
  final bool isChecked;
  final bool buttonCustom;

  const ProjectSideButton({Key? key, required this.text, required this.urlIcon, required this.isChecked, required this.buttonCustom})
      : super(key: key);

  @override
  State<ProjectSideButton> createState() => _MyProjectSideButtonState();
}


class _MyProjectSideButtonState extends State<ProjectSideButton> {
  late var isCheckedHere = widget.isChecked;
  @override
  Widget build(BuildContext context) {
    var iconSize = 20.0;
    var iconCirclePositionTop = 2.0;
    var iconCirclePositionRight = 2.0;
    var boolGreenCircle = widget.buttonCustom ? true : false;
    return SizedBox(
      height: 55,
      child: Card(
        color: widget.buttonCustom ?  ColorsRenov.primaryGreen : Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.5),
            side: isCheckedHere || widget.buttonCustom ?
            const BorderSide(color: ColorsRenov.primaryGreen, width: 2) :
            const BorderSide(color: Colors.white, width: 0)
        ),
        child: InkWell(
          onTap: () {
          isCheckedHere ? setState(() {
              isCheckedHere = false;
            }) :
            setState(() {
              isCheckedHere = true;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 30, right: iconSize, bottom:iconCirclePositionTop+2,top:2),
                child:  IconBackgroundCircle(
                    imageSize: iconSize,
                    topCirclePosition: iconCirclePositionTop,
                    rightCirclePosition: iconCirclePositionRight,
                    url: widget.urlIcon,
                    circleColor : boolGreenCircle),
              ),
              Expanded(
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14.0,
                      color: widget.buttonCustom ? Colors.white : Colors.black
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
