import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';

import 'checkbox.dart';

class CheckboxInWork extends StatelessWidget {
  final String text;

  const CheckboxInWork({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconSize = 20.0;
    var iconCirclePositionTop = 2.0;
    var iconCirclePositionRight = 2.0;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.5)),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, bottom : 10, top : 10),
              child: MyCheckboxWidget()
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
