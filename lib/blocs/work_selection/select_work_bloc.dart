import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';
part 'select_work_event.dart';
part 'select_work_state.dart';

class SelectWorkBloc extends Bloc<SelectWorkEvent, SelectWorkState> {
  SelectWorkBloc() : super( const SelectWorkInitialState()) {
    
    on<TypeSelectEvent>((event, emit) async{
       var works = await WorkRepository().doQueryFuture(event.type);
      emit (ListedWorkState(works));
    });

    // on<LoadWorksEvent>((event, emit) async {
    //   var works = await WorkRepository().doQueryFuture();
    //   emit (ListedWorkState(works));
    // });

    on<ClickWorkEvent>((event, emit) async {
    var list = WorkRepository().allValideWork();
    emit (ClickedWorkState(event.idClick, event.works, list));
    });

    on<ValitedWorkEvent>((event, emit) async {
      var list = WorkRepository().getAddValideWorkClick(event.work);
      emit (ValideWorkState(list, event.works, event.work.id));
    });

    on<WorkInProgressEvent>((event, emit) {
      var lists = WorkRepository().getTravaux();
      emit(WorkInProgressState([], [], "", lists));
    });

  }
}