import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:renov_proprietaire_app/views/widgets/left_side_bar.dart';
import 'package:renov_proprietaire_app/views/widgets/notepad.dart';
import 'package:renov_proprietaire_app/views/widgets/page_title.dart';
import 'package:renov_proprietaire_app/values/strings.dart';
import 'package:renov_proprietaire_app/views/widgets/work_in_progress_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/work_selection/select_work_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SelectWorkBloc, SelectWorkState>(
        builder: (context, state) {
      BlocProvider.of<SelectWorkBloc>(context).add(const WorkInProgressEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundGreenWave(),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                   state is WorkInProgressState ? LeftSideBar(workinprogress: state.WorkInProgress) : const LeftSideBar(workinprogress: []),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PageTitle(text: TextRenov.workInProgress),
                            const Text(TextRenov.homePageDesc),
                            SizedBox(
                              height: 200,
                              child: 
                              state is WorkInProgressState ?
                              ListView.builder(
                                  itemCount: state.WorkInProgress.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var _workInProgress = state.WorkInProgress[index];
                                    return WorkInProgressBlock(
                                        urlIcon: _workInProgress['urlIcon'],
                                        workTitle: _workInProgress['workTitle'],
                                        budget: _workInProgress['budget'],
                                        financialAssistance: _workInProgress['financialAssistance'],
                                        stepInProgress: _workInProgress['stepInProgress'],
                                        percentageCompleted: _workInProgress['percentageCompleted'],
                                        );
                                  }): 
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                            )
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
  });
  }
}
