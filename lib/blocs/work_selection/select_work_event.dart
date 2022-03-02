part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class LoadWorksEvent extends SelectWorkEvent {
  const LoadWorksEvent();
}


class ClickWorkEvent extends SelectWorkEvent {
  final String nameWork;
  const ClickWorkEvent(this.nameWork);

}


class ValitedWorkEvent extends SelectWorkEvent {
  final Work work;
  const ValitedWorkEvent(this.work);

}



