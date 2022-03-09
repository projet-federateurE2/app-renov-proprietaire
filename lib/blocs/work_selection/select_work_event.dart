part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class TypeSelectEvent extends SelectWorkEvent {
final String? type;
const TypeSelectEvent(this.type);
}

class LoadWorksEvent extends SelectWorkEvent {
  const LoadWorksEvent();
}


class ClickWorkEvent extends SelectWorkEvent {
  final String idClick;
  final List<Work> works;
  const ClickWorkEvent(this.idClick, this.works);

}


class ValitedWorkEvent extends SelectWorkEvent {
  final Work work;
  final List<Work> works;
  const ValitedWorkEvent(this.work, this.works);

}


class WorkInProgressEvent extends SelectWorkEvent{
  const WorkInProgressEvent();

}



