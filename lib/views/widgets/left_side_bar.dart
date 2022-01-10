import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/values/styles.dart';
import 'package:renov_proprietaire_app/views/widgets/icon_background_circle.dart';
import 'package:renov_proprietaire_app/views/widgets/project_side_button.dart';
import 'package:renov_proprietaire_app/views/widgets/secondary_project_side_button.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({Key? key}) : super(key: key);

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  var backgroundColor = ColorsRenov.secondaryGreen;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.22,
        heightFactor: 0.9,
          child: Column(children: [
            Expanded(
                child: Card(
                    elevation: 4.0,
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(styleRenov.roundedBorder),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top:10.0),
                              child:                         Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('./../../../assets/images/profile.jpg'),
                                      fit: BoxFit.fill
                                  ),
                                ),
                              ),
                            ),

                            Text("Paul Dupont",style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0)),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(styleRenov.roundedBorder),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0,horizontal:15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left:6.0),
                                    child: Text(TextRenov.sideProject, style: const TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 16.0)),),
                                    Padding(padding: EdgeInsets.only(top:6.0)),
                                    SecondaryProjectSideButton(
                                        text: 'Isolation des fenêtres',
                                        secondaryText: 'vérifier la conformité du devis'),
                                    Padding(padding: EdgeInsets.only(top:6.0)),
                                    SecondaryProjectSideButton(
                                        text: 'Installation pompe à chaleur',
                                        secondaryText: 'Contacter les artisans')
                                  ],
                                ),
                              ),),
                            Flexible(
                                child: ProjectSideButton(
                                    text: TextRenov.sideProjectBtn1,
                                    urlIcon: './../assets/icons/profile.svg')),
                            Flexible(
                                child: ProjectSideButton(
                                    text: TextRenov.sideProjectBtn2,
                                    urlIcon: './../assets/icons/notepad.svg')),
                            Flexible(
                                child: ProjectSideButton(
                                    text: TextRenov.sideProjectBtn3,
                                    urlIcon: './../assets/icons/phone.svg')),
                          ],
                        )
                    )
))
          ]),
    );
  }
}
