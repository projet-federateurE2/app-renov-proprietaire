part of 'select_work_bloc.dart';



// @immutable
abstract class SelectWorkState {
  final List<String> maliste;
  final List<Work> malisteWork;
  final List<String> valideWorkAll;
  const SelectWorkState(this.maliste, this.malisteWork, this.valideWorkAll);
}
 class SelectWorkInitialState extends SelectWorkState {
   const SelectWorkInitialState():super(const [], const [], const []);
}

// class SelectWorkInitialState extends SelectWorkState {
//   const SelectWorkInitialState();
// }

class ListedWorkState extends SelectWorkState {
  final List<Work> works;
  const ListedWorkState(this.works):super(const [], works, const []);
}


class ClickedWorkState extends SelectWorkState  {
  final List<String> clickedWork;
  final List<Work> works;
  final List<String> valideWork;
  const ClickedWorkState(this.clickedWork, this.works, this.valideWork):super(clickedWork, works, valideWork);
}

class ValideWorkState extends SelectWorkState  {
  final List<String> valideWorkList;
  final List<Work> works; 
  final List<String> clickedWork;
  const ValideWorkState(this.valideWorkList, this.works, this.clickedWork):super(clickedWork, works, valideWorkList);
}