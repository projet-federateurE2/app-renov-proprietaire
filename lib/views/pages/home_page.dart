import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/models/owner.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/left_side_bar.dart';
import 'package:renov_proprietaire_app/views/widgets/notepad.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/work_in_progress_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/work_selection/select_work_bloc.dart';


class HomePage extends StatefulWidget {

  final Owner user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
void initState() {
    // TODO: implement initState
   //BlocProvider.of<SelectWorkBloc>(context).add(WorkInProgressEvent(widget.user));
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SelectWorkBloc, SelectWorkState>(
      builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                  LeftSideBar(workinprogress: state.valideWork, user: widget.user),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PageTitle(text: TextRenov.workInProgress, returnisvisible: false),
                            const Text(TextRenov.homePageDesc),
                            SizedBox(
                              height: 200,
                              child: 
                              ListView.builder(
                                  itemCount: state.valideWork.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var _workInProgress =  state.valideWork[index];
                                    return WorkInProgressBlock(
                                        urlIcon: _workInProgress.urlImage,
                                        workTitle: _workInProgress.title,
                                        budget: "Non renseigné",
                                        financialAssistance:  "Non renseigné",
                                        stepInProgress: 'Trouver un artisan dans la liste',
                                        percentageCompleted: 0,
                                        );
                                   }
                                  ),
                               ),                   
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: const Notepad(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
   }
  );
  }
}

