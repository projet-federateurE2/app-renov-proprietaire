import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';

class GreenButton extends StatefulWidget {
  const GreenButton({ Key? key }) : super(key: key);

  @override
  _GreenButtonState createState() => _GreenButtonState();
}

class _GreenButtonState extends State<GreenButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Suivant"),
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        primary: ColorsRenov.primaryGreen,
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      onPressed: () {},
    );
  }
}