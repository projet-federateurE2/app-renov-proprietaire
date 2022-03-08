import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

class IconBackgroundCircle extends StatelessWidget {
  final double imageSize;
  final double topCirclePosition;
  final double rightCirclePosition;
  final String url;
  final bool circleColor;

  const IconBackgroundCircle(
      {Key? key,
      required this.imageSize,
      required this.topCirclePosition,
      required this.rightCirclePosition,
      required this.url, this.circleColor = false})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    var colorCircle = !circleColor ? ColorsRenov.secondaryGreen : ColorsRenov.primaryGreen;
    return Stack(
    children: [
        Positioned(
            top: 0,
            right: 0,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                      width: (imageSize- (imageSize*0.25)),
                      height: (imageSize- (imageSize*0.25)),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorCircle
                        ),
                        position: DecorationPosition.background,
                      ),
                    );
                   }
                 ),
                ),
        Container(
            margin: EdgeInsets.only(top:topCirclePosition , right: rightCirclePosition),
            height: imageSize,
            width: imageSize,
            child: SvgPicture.asset(url))
      ],
    );
  }
}
