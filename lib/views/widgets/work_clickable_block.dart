import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkClickableBlock extends StatefulWidget {
  final String urlImage;
  const WorkClickableBlock({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<WorkClickableBlock> createState() => _WorkClickableBlockState();
}
class _WorkClickableBlockState extends State<WorkClickableBlock> {
  @override
    Widget build(BuildContext context) {
      return Container(
          child : SizedBox(
              width: 125.0,
              height: 125.0,
              child: Card(
              elevation: 2.0,
              child: Column(children: const <Widget>[
                SvgPicture.asset(urlImage),
                Text('Craft beautiful UIs'),
              ],))
      )
      );
  }
}
