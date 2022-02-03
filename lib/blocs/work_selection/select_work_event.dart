part of 'select_work_bloc.dart';

@immutable
abstract class SelectWorkEvent {
  const SelectWorkEvent();
}

class LoadWorksEvent extends SelectWorkEvent {
  const LoadWorksEvent();
}
class ClickWorkEvent extends SelectWorkEvent {
  final int idWork;
  const ClickWorkEvent(this.idWork);

}
