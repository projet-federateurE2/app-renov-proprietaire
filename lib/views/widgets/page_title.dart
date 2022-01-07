import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';


// ignore: must_be_immutable
class PageTitle extends StatelessWidget {
  final String text;
  PageTitle({Key? key, required this.text}) : super(key: key);
  GlobalKey txtKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    RenderBox txtBox;
    return Stack(
        children: [
      Positioned(
          bottom: 6,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final keyContext = txtKey.currentContext;
                if (keyContext != null) {
                  txtBox = keyContext.findRenderObject() as RenderBox;
                  return SizedBox(
                      width: txtBox.size.width / 3.5,
                      height: txtBox.size.height / 3.5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: ColorsRenov.secondaryGreen,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        position: DecorationPosition.background,
                      ));
                } else {
                  return const Text("");
                }
              })),
          Text(text, key: txtKey, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600))
    ]
      );
  }
}

