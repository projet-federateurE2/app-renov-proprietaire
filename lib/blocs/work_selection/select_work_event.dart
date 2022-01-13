part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class SelectWorkDoQueryEvent extends SelectWorkEvent {
  final String query;

  const SelectWorkDoQueryEvent(this.query);
}
