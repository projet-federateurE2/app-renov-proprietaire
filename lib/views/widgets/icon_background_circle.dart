import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

class IconBackgroundCircle extends StatelessWidget {
  final double imageSize;
  final double topCirclePosition;
  final double rightCirclePosition;
  final String url;
  final double? margin;

  const IconBackgroundCircle(
      {Key? key,
        required this.imageSize,
        required this.topCirclePosition,
        required this.rightCirclePosition,
        required this.url,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: topCirclePosition,
            right: rightCirclePosition,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                      width: (imageSize- (imageSize*0.3)),
                      height: (imageSize- (imageSize*0.3)),
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsRenov.secondaryGreen
                        ),
                        position: DecorationPosition.background,
                      ));
                })),
        Container(
            margin:const EdgeInsets.only(top: 10, right: 10),
            height: imageSize,
            width: imageSize,
            child: SvgPicture.asset(url)
        )
      ],
    );
  }
}
