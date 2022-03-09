import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

class ButtonRenov extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;
  final Color btnColor;
  final double size;
  final double paddingHorizontal;

  const ButtonRenov(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.enabled,
      this.btnColor = ColorsRenov.primaryGreen,
      this.size = 0,
      this.paddingHorizontal = 40.0})
      : super(key: key);
  @override
  _ButtonRenovState createState() => _ButtonRenovState();
}

class _ButtonRenovState extends State<ButtonRenov> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: widget.size),
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        primary: widget.btnColor,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: widget.paddingHorizontal,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: widget.enabled ? widget.onPressed : null,
    );
  }
}
