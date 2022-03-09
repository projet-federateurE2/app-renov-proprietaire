import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/pages/home_page.dart';
import 'package:renov_proprietaire_app/views/widgets/button_renov.dart';
import 'package:renov_proprietaire_app/views/widgets/validate_work_card.dart';

import 'page_title.dart';

class PopupValidateWork extends StatelessWidget {
  final List<Work> workToValidate;
  SingleChildScrollView? columnWorkToValidate;

  PopupValidateWork({Key? key, required this.workToValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWorkToValidate =
        List.generate(0, (index) => const ValidateWorkCard(validateWork: null));

    for (var element in workToValidate) {
      listWorkToValidate.add(ValidateWorkCard(validateWork: element));
    }

    columnWorkToValidate = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listWorkToValidate,
      ),
    );

    return AlertDialog(
      title: PageTitle(text: TextRenov.workSelected),
      content: columnWorkToValidate!,
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ButtonRenov(
            btnColor: ColorsRenov.darkBlue,
            text: TextRenov.btnCancel,
            onPressed: () {
              Navigator.of(context).pop();
            },
            enabled: true,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ButtonRenov(
            text: TextRenov.btnValidate,
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            enabled: true,
          ),
        ),
      ],
    );
  }
}
