import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/values/styles.dart';
import 'package:renov_proprietaire_app/views/widgets/project_side_button.dart';
import 'package:renov_proprietaire_app/views/widgets/secondary_project_side_button.dart';

import '../../models/owner.dart';

class LeftSideBar extends StatefulWidget {
  final List<Work>? workinprogress;
  final Owner user;
  const LeftSideBar({Key? key, required this.workinprogress, required this.user}) : super(key: key);

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  var backgroundColor = ColorsRenov.secondaryGreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(children: [
        Expanded(
          child: Card(
            elevation: 4.0,
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(styleRenov.roundedBorder),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(children: <Widget>[
                    SvgPicture.asset('./../../assets/icons/account_avatar.svg',
                        width: 100.0, height: 100.0),
                     Text(widget.user.prenom + " " + widget.user.nom,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.0)),
                  ]),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(styleRenov.roundedBorder),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Text(TextRenov.sideProject,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0)),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 6.0)),
                          ...List.generate(widget.workinprogress!.length,
                              (index) {
                            var _workInProgress = widget.workinprogress![index];
                            return SecondaryProjectSideButton(
                              text: _workInProgress.title,
                              secondaryText: _workInProgress.titleDesc,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  const Flexible(
                    child: ProjectSideButton(
                        text: TextRenov.sideProjectBtn1,
                        urlIcon: './../assets/icons/profile.svg',
                        isChecked: false,
                        buttonCustom: false),
                  ),
                  const Flexible(
                    child: ProjectSideButton(
                        text: TextRenov.sideProjectBtn2,
                        urlIcon: './../assets/icons/notepad.svg',
                        isChecked: true,
                        buttonCustom: false),
                  ),
                  const Flexible(
                    child: ProjectSideButton(
                        text: TextRenov.sideProjectBtn3,
                        urlIcon: './../assets/icons/phone.svg',
                        isChecked: false,
                        buttonCustom: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
