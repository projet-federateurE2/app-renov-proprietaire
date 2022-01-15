part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class SelectWorksDoQueryEvent extends SelectWorkEvent {
  // final String works;
  const SelectWorksDoQueryEvent(/*this.works*/);
}
