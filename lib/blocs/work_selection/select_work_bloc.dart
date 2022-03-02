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
    listClickWork = WorkRepository().getAddWorkClick(event.nameWork);
    var list = WorkRepository().allValideWork();
    emit (ClickedWorkState(listClickWork, works, list));
    });

    on<ValitedWorkEvent>((event, emit) async {
      var list = WorkRepository().getAddValideWorkClick(event.work);
      print(list.length);
      var works = await WorkRepository().doQueryFuture();
      var listClickWork = WorkRepository().allWorkClick();
      print(listClickWork.length);
      emit (ValideWorkState(list, works, listClickWork));
    });

  }
}