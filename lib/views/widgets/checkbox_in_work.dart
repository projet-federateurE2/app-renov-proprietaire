import 'package:flutter/material.dart';

import 'checkbox.dart';

class CheckboxInWork extends StatelessWidget {
  final String text;

  const CheckboxInWork({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.5)),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 10),
                child: MyCheckboxWidget()),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
