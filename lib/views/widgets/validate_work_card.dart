import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/models/work.dart';

import 'icon_background_circle.dart';

class ValidateWorkCard extends StatelessWidget {
  final Work? validateWork;

  const ValidateWorkCard(
      {Key? key,
        required this.validateWork
      })
      : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
          color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(13.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                IconBackgroundCircle(
                    url: validateWork!.urlImage,
                    imageSize: 55,
                    rightCirclePosition: 15,
                    topCirclePosition: 15),
                Text(validateWork!.title),
              ],
            )
          )
        )
      ],
    );
  }
}