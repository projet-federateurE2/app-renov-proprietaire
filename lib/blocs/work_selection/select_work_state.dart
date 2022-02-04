part of 'select_work_bloc.dart';



// @immutable
abstract class SelectWorkState {
  final List<String> maliste;
  final List<Work> malisteWork;
  const SelectWorkState(this.maliste, this.malisteWork);
}
 class SelectWorkInitialState extends SelectWorkState {
   const SelectWorkInitialState():super(const [], const []);
}

// class SelectWorkInitialState extends SelectWorkState {
//   const SelectWorkInitialState();
// }

class ListedWorkState extends SelectWorkState {
  final List<Work> works;
  const ListedWorkState(this.works):super(const [], works);
}


class ClickedWorkState extends SelectWorkState  {
  final List<String> clickedWork;
  final List<Work> works;
  const ClickedWorkState(this.clickedWork, this.works):super(clickedWork, works);
}