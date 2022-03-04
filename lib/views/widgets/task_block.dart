import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkbox.dart';

class TaskBlock extends StatelessWidget {
  final String textFortask;
  final bool isChecked;
  const TaskBlock(
      {Key? key, required this.textFortask, required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              MyCheckboxWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(textFortask),
              )
            ],
          ),
        ),
      ),
    );
  }
}
