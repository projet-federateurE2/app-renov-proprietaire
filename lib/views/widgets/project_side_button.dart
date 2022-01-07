import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';


class ProjectSideButton extends StatelessWidget {

  final String text;
  const ProjectSideButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child : const IconBackgroundCircle(imageSize: 80, topCirclePosition: 0, rightCirclePosition:5, url: "icons/house.svg"),
          ),

        Text(text, style: const TextStyle(color: ColorsRenov.darkBlue, fontSize: 14, fontWeight: FontWeight.w600)),
      ]),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.black,
        primary: Colors.white,
        fixedSize: Size(400, 70),

        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ), 
      
      
      onPressed: () {},
    );
  }
}
