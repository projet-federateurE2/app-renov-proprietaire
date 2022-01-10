import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_type_clickable_block.dart';

class WorkTypeSelectionPage extends StatelessWidget {
  const WorkTypeSelectionPage
({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageTitle(text: TextRenov.startProject),
                const SizedBox(
                  width: 900,
                  child: Text(
                    TextRenov.startProjectDesc,
                    style: TextStyle(
                      fontSize: 26,
                      color: ColorsRenov.darkBlue
                    ),
                  ),
                )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WorkTypeClickableBlock(iconUrl: "icons/house.svg", iconSize: 90, workTypeTitle: "Isolation", workTypeDescription: "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été."),
                    WorkTypeClickableBlock(iconUrl: "icons/heating.svg", iconSize: 90, workTypeTitle: "Chauffage", workTypeDescription: "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été."),
                    WorkTypeClickableBlock(iconUrl: "icons/ventilation.svg", iconSize: 90, workTypeTitle: "Ventilation", workTypeDescription: "Pour faire des économies d’énergie, et améliorer votre confort en hiver comme en été.")

                  ],
                )
              ],
            )
          )
          ],
      ),
    );
  }
}