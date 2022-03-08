import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';
import 'package:renov_proprietaire_app/views/pages/home_page.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/validate_work_card.dart';

import 'dark_blue_button.dart';
import 'page_title.dart';

class PopupValidateWork extends StatelessWidget {
  final List<Work> workToValidate;
  SingleChildScrollView? columnWorkToValidate;

  PopupValidateWork({Key? key, required this.workToValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWorkToValidate = List.generate(0, (index) => const ValidateWorkCard(validateWork: null));

    workToValidate.forEach((element) {listWorkToValidate.add(ValidateWorkCard(validateWork: element));});

    columnWorkToValidate = SingleChildScrollView(
        child : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listWorkToValidate,
        ),
    ) ;

    return AlertDialog(
      title: PageTitle(text: "Vos travaux selectionnés pour votre projet"),
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
            await WorkRepository().QueryOwners();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage()
                )
            );
          },
          enabled: true,
        ),
      ],
    );
  }
}