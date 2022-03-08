part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class LoadWorksEvent extends SelectWorkEvent {
  const LoadWorksEvent();
}


class ClickWorkEvent extends SelectWorkEvent {
  final String idClick;
  const ClickWorkEvent(this.idClick);

}


class ValitedWorkEvent extends SelectWorkEvent {
  final Work work;
  const ValitedWorkEvent(this.work);

}


class WorkInProgressEvent extends SelectWorkEvent{
  const WorkInProgressEvent();

}



