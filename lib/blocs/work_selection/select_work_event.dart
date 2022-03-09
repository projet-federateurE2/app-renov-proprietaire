part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class UserEvent extends SelectWorkEvent {
  const UserEvent();
}

class TypeSelectEvent extends SelectWorkEvent {
final String? type;
final Owner? user;
const TypeSelectEvent(this.type, this.user);
}

class LoadWorksEvent extends SelectWorkEvent {
  const LoadWorksEvent();
}


class ClickWorkEvent extends SelectWorkEvent {
  final String idClick;
  final List<Work> works;
  final Owner? user;
  const ClickWorkEvent(this.idClick, this.works, this.user);

}


class ValitedWorkEvent extends SelectWorkEvent {
  final Work work;
  final List<Work> works;
  final Owner? user;
  const ValitedWorkEvent(this.work, this.works, this.user);

}


class WorkInProgressEvent extends SelectWorkEvent{
  final Owner user;
  const WorkInProgressEvent(this.user);

}



