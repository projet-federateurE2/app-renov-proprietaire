part of 'select_work_bloc.dart';


// @immutable
abstract class SelectWorkState {
  final String idClick;
  final List<Work> malisteWork;
  final List<Work> valideWork;
  final Owner? user;
  const SelectWorkState(this.idClick, this.malisteWork, this.valideWork, this.user);
}
 class SelectWorkInitialState extends SelectWorkState {
   const SelectWorkInitialState():super("", const [], const [], null);
}

class UserState extends SelectWorkState {
  final Owner user;
 UserState(this.user):super("", const [], const [], user);
}

class ListedWorkState extends SelectWorkState {
  final List<Work> works;
  final Owner user;
  final List<Work> validework;
  ListedWorkState(this.works, this.user, this.validework):super(works[0].id, works, validework, user);
}


class ClickedWorkState extends SelectWorkState  {
  final String idClick;
  final List<Work> works;
  final List<Work> valideWork;
  final Owner user;
  const ClickedWorkState(this.idClick, this.works, this.valideWork, this.user):super(idClick, works, valideWork, user);
}

class ValideWorkState extends SelectWorkState  {
  final List<Work> valideWork;
  final List<Work> works; 
  final String idClick;
  final Owner user;
  const ValideWorkState(this.valideWork, this.works, this.idClick, this.user):super(idClick, works, valideWork, user);
}


class WorkInProgressState extends SelectWorkState 
{
 final List<Work> valideWork;
  final List<Work> works; 
  final String idClick;
  final List<dynamic> WorkInProgress;
  final Owner user;
  const WorkInProgressState(this.valideWork, this.works, this.idClick, this.WorkInProgress, this.user):super(idClick, works, valideWork, user);
}