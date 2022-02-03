part of 'select_work_bloc.dart';


// @immutable
abstract class SelectWorkState {
  const SelectWorkState();
}

class SelectWorkInitialState extends SelectWorkState {
  const SelectWorkInitialState();
}


class ListedWorkState extends SelectWorkState {
  final List<Work> works;
  const ListedWorkState(this.works);
}


class ListedWorkClickState extends SelectWorkState {
  final String worksClick;
  const ListedWorkClickState(this.worksClick);
}



