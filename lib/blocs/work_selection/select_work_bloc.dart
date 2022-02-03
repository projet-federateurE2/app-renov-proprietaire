import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:renov_proprietaire_app/models/work.dart';
import 'package:renov_proprietaire_app/repositories/work_repository.dart';

part 'select_work_event.dart';
part 'select_work_state.dart';

class SelectWorkBloc extends Bloc<SelectWorkEvent, SelectWorkState> {
  SelectWorkBloc() : super(const SelectWorkInitialState()) {
    on<SelectWorksDoQueryEvent>((event, emit) async {
      var works = await WorkRepository().doQuery();
      emit (ListedWorkState(works));
    });
    on<SelectWorksClick>((event, emit) async {
      print(event.worksName);
    });

/*    on<SearchResolveQueryEvent>((event, emit) {
      emit (SearchResolvedState(event.cards));
    });
    on<SearchDoQueryEvent>((event, emit) async {
      print('here');
      emit (const SearchLoadingState());
      var cards = await ScryfallRepository().doQuery(event.query);
      emit (SearchResolvedState(cards));
    });
    on<SearchClearEvent>((event, emit) async {
      emit(const SearchInitialState());
    });*/
  }
}
