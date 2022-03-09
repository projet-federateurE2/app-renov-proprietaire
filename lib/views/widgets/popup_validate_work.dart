import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/views/pages/home_page.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/validate_work_card.dart';
import '../../models/owner.dart';
import 'dark_blue_button.dart';
import 'page_title.dart';

class PopupValidateWork extends StatelessWidget {
  final List<Work> workToValidate;
  final Owner user;
  SingleChildScrollView? columnWorkToValidate;

  PopupValidateWork({Key? key, required this.workToValidate, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWorkToValidate = List.generate(0, (index) => const ValidateWorkCard(validateWork: null));

    for (var element in workToValidate) 
    {
      listWorkToValidate.add(ValidateWorkCard(validateWork: element));
    }

    columnWorkToValidate = SingleChildScrollView(
        child : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listWorkToValidate,
        ),
    ) ;

    return AlertDialog(
      title: PageTitle(text: "Vos travaux selectionnés pour votre projet", returnisvisible: false),
      content: columnWorkToValidate!,
      actions: <Widget>[
        DarkBlueButton(
          text: "Annuler",
          onPressed: () {
            Navigator.of(context).pop();
          },
          enabled: true,
        ),
        GreenButton(
          text: "Valider",
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(user: user)
                )
            );
          },
          enabled: true,
        ),
      ],
    );
  }
}