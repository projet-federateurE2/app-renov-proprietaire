import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

class WorkSelectionEmptyDescription extends StatelessWidget {
  final IconBackgroundCircle iconBackgroundCircle;
  final String workTypeDescription;

  const WorkSelectionEmptyDescription({
    Key? key,
    required this.iconBackgroundCircle,
    required this.workTypeDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    bottom: 20,
                    left: (((iconBackgroundCircle.imageSize * 0.3) / 2) +
                        iconBackgroundCircle.rightCirclePosition)),
                child: iconBackgroundCircle),
            Text(
              workTypeDescription,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w200, fontSize: 17.0),
            ),
          ],
        ),
      ),
    );
  }
}
