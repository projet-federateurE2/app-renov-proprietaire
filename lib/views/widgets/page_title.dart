import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  PageTitle({Key? key, required this.text}) : super(key: key);
  GlobalKey txtKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var txtBox;
    return Stack(children: [
      Text(text, key: txtKey, style: TextStyle(fontSize: 30)),
      Positioned(
          bottom: 2,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final keyContext = txtKey.currentContext;
                if (keyContext != null) {
                  txtBox = keyContext.findRenderObject() as RenderBox;
                  return SizedBox(
                      width: txtBox.size.width / 2.5,
                      height: txtBox.size.height / 3,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0x664CD8AD),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        position: DecorationPosition.background,
                      ));
                } else {
                  return new Text('rien du tout');
                }
              })),
    ]);
  }
}

