part of 'select_work_bloc.dart';



// @immutable
abstract class SelectWorkState {
  const SelectWorkState();
}
class SelectWorkInitialState extends SelectWorkState {
  const SelectWorkInitialState();
}
class ListedWorkState extends SelectWorkState {
  final Stream<List<Work>> works;
  const ListedWorkState(this.works);
}
class ClickedWorkState extends SelectWorkState  {
  final Stream<List<Work>> works;
  final Stream<Work> clickedWork;
  const ClickedWorkState(this.works, this.clickedWork);
}