import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:renov_proprietaire_app/models/owner.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';
part 'select_work_event.dart';
part 'select_work_state.dart';

class SelectWorkBloc extends Bloc<SelectWorkEvent, SelectWorkState> {
  SelectWorkBloc() : super( const SelectWorkInitialState()) {
    

    on<UserEvent>((event, emit) async {
      var user = await WorkRepository().queryOwners();
      emit (UserState(user));
    });

    on<TypeSelectEvent>((event, emit) async{
       var works = await WorkRepository().doQueryFuture(event.type);
       var list = WorkRepository().allValideWork();
       emit (ListedWorkState(works, event.user!, list));
    });

    on<ClickWorkEvent>((event, emit) async {
    var list = WorkRepository().allValideWork();
    emit (ClickedWorkState(event.idClick, event.works, list, event.user!));
    });

    on<ValitedWorkEvent>((event, emit) async {
      var list = WorkRepository().getAddValideWorkClick(event.work);
      emit (ValideWorkState(list, event.works, event.work.id, event.user!));
    });

    on<WorkInProgressEvent>((event, emit) {
      var lists = WorkRepository().getTravaux();
      emit(WorkInProgressState([], [], "", lists, event.user));
    });

  }
}