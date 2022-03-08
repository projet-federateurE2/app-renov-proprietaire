import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';


class MyCheckboxWidget extends StatefulWidget {
  const MyCheckboxWidget({Key? key}) : super(key: key);

  @override
  State<MyCheckboxWidget> createState() => _MyCheckboxWidgetState();
}

class _MyCheckboxWidgetState extends State<MyCheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorsRenov.primaryGreen;
      }
      return ColorsRenov.primaryGreen;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        }
       );
      },
    );
  }
}
