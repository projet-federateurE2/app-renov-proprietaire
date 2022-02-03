import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_clickable_block.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_empty_description.dart';

class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  var numberColumns;
  var sizeScreen = 0.0;

  void clickWork(BuildContext context, SelectWorkEvent event) {
    BlocProvider.of<SelectWorkBloc>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size.width;
    if (sizeScreen > 1500) {
      numberColumns = 3;
    } else {
      numberColumns = 2;
    }

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
                            // likely needed
                            child: PageTitle(text: "Travaux d'isolation"))),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: StreamBuilder(
                            stream: WorkRepository().doQuery(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasData) {
                                List clickableBlocks = snapshot.data;
                                return BlocBuilder<SelectWorkBloc, SelectWorkState>(builder: (context, state) {
                                  if (state is SelectWorkInitialState) {
                                    return GridView.count(
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                      scrollDirection: Axis.vertical,
                                      crossAxisCount: numberColumns,
                                      children: List.generate(
                                          snapshot.data.length, (index) {
                                        var clickableBlock =
                                            clickableBlocks[index];
                                        return WorkClickableBlock(
                                          urlImage: clickableBlock.urlImage,
                                          workName: clickableBlock.title,
                                          isSelected: false,
                                          getId: (id) {
                                            BlocProvider.of<SelectWorkBloc>(context).add(ClickWorkEvent(id));
                                          },
                                        );
                                      }),
                                    );
                                  }
                                else if(state is ClickedWorkState)
                                {
                                      return GridView.count(
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                      scrollDirection: Axis.vertical,
                                      crossAxisCount: numberColumns,
                                      children: List.generate(
                                          snapshot.data.length, (index) {
                                        var clickableBlock =
                                            clickableBlocks[index];
                                        return WorkClickableBlock(
                                          urlImage: clickableBlock.urlImage,
                                          workName: clickableBlock.title,
                                          isSelected: state.clickedWork.contains(clickableBlock.title) ? true : false,
                                          getId: (id) {
                                             BlocProvider.of<SelectWorkBloc>(context).add(ClickWorkEvent(id));
                                          },
                                        );
                                      }),
                                    );
                                  }
                                  else {return const Text("CC");}
                                }                             
                                );
                              } else {
                                return const Text("Y'a r");
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const WorkSelectionEmptyDescription(),
                              GreenButton(
                                  text: "coucou",
                                  onPressed: () {},
                                  enabled: true)
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ))
          ],
        ),
      );
    });
  }
}
