import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class WorkTypeClickableBlock extends StatelessWidget {
  final IconBackgroundCircle iconBackgroundCircle;
  final String workTypeTitle;
  final String workTypeDescription;
// final Widget page
  const WorkTypeClickableBlock(
      {Key? key,
        required this.iconBackgroundCircle,
        required this.workTypeTitle,
        required this.workTypeDescription, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353,
      height: 350,
      child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),

          child: InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () { },
            child:  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 20,left: ((iconBackgroundCircle.imageSize*0.3))),
                      child : iconBackgroundCircle
                  ),
                  Text(workTypeTitle,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 27.0),
                  ),
                  Text(workTypeDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 17.0),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
