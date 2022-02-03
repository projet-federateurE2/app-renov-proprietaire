import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_clickable_block.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_description.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_empty_description.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkSelectionPage extends StatefulWidget {
  final String workType;

  const WorkSelectionPage({Key? key, required this.workType}) : super(key: key);

  @override
  _WorkSelectionPageState createState() => _WorkSelectionPageState();
}

class _WorkSelectionPageState extends State<WorkSelectionPage> {
  var workname1 = "hihi";
  var sizeScreen = 0.0;
  var numberColumns;
  var isBtnEnabled = false;
  var text;
  var data = rootBundle.loadString("data.json");

  onPressed() {
    setState(() {
      isBtnEnabled = true;
    });
  }

  void loadingWorks(BuildContext context, SelectWorkEvent event) {
    BlocProvider.of<SelectWorkBloc>(context).add(event);
  }

  void clickWork(BuildContext context, SelectWorkEvent event) {
    BlocProvider.of<SelectWorkBloc>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    loadingWorks(
      context,
      LoadWorksEvent(),
    );
    sizeScreen = MediaQuery.of(context).size.width;
    if (sizeScreen > 1500) {
      numberColumns = 3;
    } else {
      numberColumns = 2;
    }

    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
        builder: (context, state) {
      if (state is SelectWorkInitialState) {
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
                    Text("Loading...")
                  ],
                ),
              )
            ],
          ),
        );
      }
      if (state is ListedWorkState) {
        print('listed');
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
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
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: GridView.count(
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 20.0,
                                  scrollDirection: Axis.vertical,
                                  crossAxisCount: numberColumns,
                                  children: [
                                    for (var work in state.works)
                                      InkWell(
                                          onTap: () {
                                            clickWork(context,
                                                ClickWorkEvent(work.id));
                                          },
                                          child: WorkClickableBlock(
                                            urlImage: work.urlImage,
                                            workName: work.title,
                                            isSelected: false,
                                          )),
                                  ])),
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                WorkSelectionEmptyDescription(),
                                GreenButton(
                                    text: "coucou",
                                    onPressed: onPressed,
                                    enabled: isBtnEnabled)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]));
      }
      if (state is ClickedWorkState) {
        print(state.clickedWork.id);
        isSelected(id) {
          if (state.clickedWork.id == id) {
            print(true);
            return true;
          } else {
            print(false);
            return false;
          }
        }

        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
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
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: GridView.count(
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 20.0,
                                  scrollDirection: Axis.vertical,
                                  crossAxisCount: numberColumns,
                                  children: [
                                      StreamBuilder
                                        (
                                  stream: state.works ,
                                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            }

                                            if (snapshot.hasData) {
                                              List clickableBlocks = snapshot.data;
                                              return ListView.builder(
                                                  itemCount: snapshot.data.length,
                                                  itemBuilder: (context, index) {
                                                    var clickableBlock = clickableBlocks[index];

                                                    return InkWell(
                                                        onTap: () {
                                                          clickWork(context,
                                                              ClickWorkEvent(snapshot.data.urlImage));
                                                        },
                                                        child: WorkClickableBlock(
                                                            urlImage: clickableBlock.urlImage,
                                                            workName: clickableBlock.title,
                                                            isSelected: isSelected(
                                                                clickableBlock.id)));
                                                  },
                                              );
                                            }
                                          }
                                  )
                      ]))])),

                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                WorkSelectionEmptyDescription(),
                                GreenButton(
                                    text: "coucou",
                                    onPressed: onPressed,
                                    enabled: isBtnEnabled)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]));
      } else {
        return Text("pas drôle du tout !");
      }
    });
  }
}
