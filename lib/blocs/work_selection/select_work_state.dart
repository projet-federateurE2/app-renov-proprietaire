part of 'select_work_bloc.dart';


// @immutable
abstract class SelectWorkState {
  final String idClick;
  final List<Work> malisteWork;
  final List<Work> valideWork;
  const SelectWorkState(this.idClick, this.malisteWork, this.valideWork);
}
 class SelectWorkInitialState extends SelectWorkState {
   const SelectWorkInitialState():super("", const [], const []);
}

class ListedWorkState extends SelectWorkState {
  final List<Work> works;
  ListedWorkState(this.works):super(works[0].id, works, const []);
}


class ClickedWorkState extends SelectWorkState  {
  final String idClick;
  final List<Work> works;
  final List<Work> valideWork;
  const ClickedWorkState(this.idClick, this.works, this.valideWork):super(idClick, works, valideWork);
}

class ValideWorkState extends SelectWorkState  {
  final List<Work> valideWork;
  final List<Work> works; 
  final String idClick;
  const ValideWorkState(this.valideWork, this.works, this.idClick):super(idClick, works, valideWork);
}