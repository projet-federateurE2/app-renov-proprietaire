import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/popup_validate_work.dart';
import 'package:renov_proprietaire_app/views/widgets/user_in_corner.dart';
import 'package:renov_proprietaire_app/views/widgets/work_clickable_block.dart';

import '../widgets/work_selection_description.dart';

class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  var numberColumns;
  var sizeScreen = 0.0;


  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size.width;
    numberColumns = sizeScreen > 1500 ? 3 : 2;
    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
        builder: (context, state) {
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
                  Hero(
                    tag: "title-select-work",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PageTitle(
                                    text: "Travaux d'isolation",
                                    returnisvisible: true),
                              ),
                              const UserInCorner(name: "Paul Dupont"),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                              child: Text(
                                'Selectionnez et ajoutez à votre projet chaque travaux envisagés.',
                                style: TextStyle(fontStyle: FontStyle.italic, color: ColorsRenov.darkBlue, fontSize: 17),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GridView.count(
                              mainAxisSpacing: 20.0,
                              crossAxisSpacing: 20.0,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: numberColumns,
                              children: List.generate(state.malisteWork.length,
                                  (index) {
                                var clickableBlock = state.malisteWork[index];
                                return WorkClickableBlock(
                                  urlImage: clickableBlock.urlImage,
                                  workName: clickableBlock.title,
                                  isSelected:
                                      state.idClick.contains(clickableBlock.id),
                                  isChecked: state.valideWork
                                      .where((element) => element.id
                                          .contains(clickableBlock.id))
                                      .isNotEmpty,
                                  idWork: clickableBlock.id,
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                WorkSelectionDescription(
                                    work: state.malisteWork.isEmpty
                                        ? Work("", "", "", "", "", "")
                                        : state.malisteWork
                                            .where((element) => element.id
                                                .contains(state.idClick))
                                            .first),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: GreenButton(
                                      text: TextRenov.btnNext,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              PopupValidateWork(
                                                  workToValidate:
                                                      state.valideWork),
                                        );
                                      },
                                      enabled: state.valideWork.isNotEmpty
                                          ? true
                                          : false),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
