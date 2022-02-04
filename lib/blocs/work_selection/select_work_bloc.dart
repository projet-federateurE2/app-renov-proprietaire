import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';

part 'select_work_event.dart';
part 'select_work_state.dart';

class SelectWorkBloc extends Bloc<SelectWorkEvent, SelectWorkState> {
  SelectWorkBloc() : super(const SelectWorkInitialState()) {

    on<LoadWorksEvent>((event, emit) async {
      var works = await WorkRepository().doQueryFuture();
      emit (ListedWorkState(works));
    });

    on<ClickWorkEvent>((event, emit) async {
    var listClickWork = WorkRepository().allWorkClick();
     var works = await WorkRepository().doQueryFuture();
      emit (ListedWorkState(works));
    if(!listClickWork.contains(event.nameWork))
    {
    listClickWork = WorkRepository().getAddWorkClick(event.nameWork);
    }
    else
    {
      listClickWork = WorkRepository().getRemoveWorkClick(event.nameWork);
    }
      emit (ClickedWorkState(listClickWork, works));
    });

  }
}