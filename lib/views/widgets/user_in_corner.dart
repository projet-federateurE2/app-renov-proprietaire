import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/values/styles.dart';
import 'package:renov_proprietaire_app/views/widgets/project_side_button.dart';
import 'package:renov_proprietaire_app/views/widgets/secondary_project_side_button.dart';

class UserInCorner extends StatefulWidget {
  final String name;

  const UserInCorner({Key? key, required this.name}) : super(key: key);

  @override
  State<UserInCorner> createState() => _UserInCornerState();
}

class _UserInCornerState extends State<UserInCorner> {
  var backgroundColor = ColorsRenov.secondaryGreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: <Widget>[
          SvgPicture.asset('./../../assets/icons/account_avatar.svg',
              width: 70.0, height: 70.0),
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
