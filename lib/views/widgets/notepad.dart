import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'icon_background_circle.dart';

class Notepad extends StatefulWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  _NotepadState createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  @override
  Widget build(BuildContext context) {
    var iconSize = 20.0;
    var iconCirclePositionTop = 2.0;
    var iconCirclePositionRight = 2.0;
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 30,
                      right: iconSize,
                      bottom: iconCirclePositionTop + 2,
                      top: 2),
                  child: IconBackgroundCircle(
                      imageSize: iconSize,
                      topCirclePosition: iconCirclePositionTop,
                      rightCirclePosition: iconCirclePositionRight,
                      url: IconsRenov.notepad),
                ),
                const Expanded(
                  child: Text(
                    "Bloc-notes",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                )
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50, top: 10),
              child: TextField(
                maxLines: 8,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),

                  ),

                  hintStyle: TextStyle(fontSize: 12), // you need this
                  hintText:
                      'Je suis votre bloc-notes , et je vous suivrai tout au long de votre projet. \nN’hesitez pas à m’utiliser comme carnet de route, pense bête, mémoire...',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
