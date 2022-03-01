import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';


// ignore: must_be_immutable
class TaskTitle extends StatelessWidget {
  final String text;
  TaskTitle({Key? key, required this.text}) : super(key: key);
  GlobalKey txtKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RenderBox txtBox;
    return Stack(
        children: [
          Positioned(
              left: 0,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final keyContext = txtKey.currentContext;
                    if (keyContext != null) {
                      txtBox = keyContext.findRenderObject() as RenderBox;
                      return const SizedBox(
                          width: 30,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsRenov.secondaryGreen,
                            ),
                            position: DecorationPosition.background,
                          ));
                    } else {
                      return const Text("");
                    }
                  })),
          Container(
              margin: const EdgeInsets.only(left:15),
              child: Text(text, key: txtKey, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)))
        ]
    );
  }
}

