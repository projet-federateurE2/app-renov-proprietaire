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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        const IconBackgroundCircle(imageSize: 30, topCirclePosition: 5, rightCirclePosition: 5, url: "icons/house.svg"),
        Text(text),
      ]),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.black,
        primary: ColorsRenov.white,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onPressed: () {},
    );
  }
}
