import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/values/styles.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/views/widgets/work_clickable_block.dart';
import 'package:renov_proprietaire_app/views/widgets/work_selection_empty_description.dart';

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
  void initState() {
    BlocProvider.of<SelectWorkBloc>(context).add(const LoadWorksEvent());
    super.initState();
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
                            child: PageTitle(text: "Travaux d'isolation"))),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child:                            
                                 GridView.count(
                                      mainAxisSpacing: 20.0,
                                      crossAxisSpacing: 20.0,
                                      scrollDirection: Axis.vertical,
                                       shrinkWrap: true,
                                      crossAxisCount: numberColumns,
                                      children:  List.generate(                                     
                                       state.malisteWork.length, (index) {
                                        var clickableBlock = state.malisteWork[index];
                                      return WorkClickableBlock(
                                          urlImage: clickableBlock.urlImage,
                                          workName: clickableBlock.title,
                                          isSelected: state.maliste.contains(clickableBlock.title), 
                                          isChecked: state.valideWork.contains(clickableBlock.title),
                                          );
                                      }),
                                    )                              
                                 ),
                          Expanded(
                            child:                           
                             Column(
                              children: [                                                           
                               !state.maliste.isNotEmpty ? const WorkSelectionEmptyDescription():  
                               WorkSelectionDescription(stringDesc1: state.malisteWork.where((element) => element.title == state.maliste[0]).first.txt1, stringDesc2: state.malisteWork.where((element) => element.title == state.maliste[0]).first.txt2, titleDesc: state.malisteWork.where((element) => element.title == state.maliste[0]).first.title, urlImage: state.malisteWork.where((element) => element.title == state.maliste[0]).first.urlImage),
                               GreenButton(
                                    text: "Suivant",
                                    onPressed: () {},
                                    enabled: state.valideWork.isNotEmpty ? true : false)
                              ],
                            ),                         
                          )
                        ],
                      ),
                    ),
                  ],
                ))
          ]));
    });
  }
}
