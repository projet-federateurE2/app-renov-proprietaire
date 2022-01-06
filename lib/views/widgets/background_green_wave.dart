import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundGreenWave extends StatelessWidget {
  const BackgroundGreenWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SvgPicture.asset(
      'images/green_wave_background.svg',
      alignment: Alignment.bottomRight,
      height: width <= 1024 ? MediaQuery.of(context).size.height : null,
      width: width > 1024 ? MediaQuery.of(context).size.width : null,
    );
  }
}
