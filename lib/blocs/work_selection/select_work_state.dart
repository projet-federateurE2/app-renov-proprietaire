part of 'select_work_bloc.dart';


// @immutable
abstract class SelectWorkState {
  final List<String> maliste;
  final List<Work> malisteWork;
  final List<Work> valideWork;
  const SelectWorkState(this.maliste, this.malisteWork, this.valideWork);
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
  final List<Work> valideWork;
  const ClickedWorkState(this.clickedWork, this.works, this.valideWork):super(clickedWork, works, valideWork);
}

class ValideWorkState extends SelectWorkState  {
  final List<Work> valideWork;
  final List<Work> works; 
  final List<String> clickedWork;
  const ValideWorkState(this.valideWork, this.works, this.clickedWork):super(clickedWork, works, valideWork);
}