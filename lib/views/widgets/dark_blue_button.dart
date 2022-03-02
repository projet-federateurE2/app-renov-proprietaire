import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

class DarkBlueButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  const DarkBlueButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        required this.enabled})
      : super(key: key);

  @override
  _DarkBlueButtonState createState() => _DarkBlueButtonState();
}

class _DarkBlueButtonState extends State<DarkBlueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        //shadowColor: Colors.transparent,
        primary: ColorsRenov.darkBlue,
        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: widget.enabled ? widget.onPressed : null,
    );
  }
}
