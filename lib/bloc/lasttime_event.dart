sealed class LastTimeEvent {}

class LoadEvent extends LastTimeEvent{}

class LastTimeActionEvent extends LastTimeEvent{
  final int id;
  final DateTime lastAction;
  LastTimeActionEvent(this.id, this.lastAction);
}

class SearchEvent extends LastTimeEvent{
  final String key;
  SearchEvent(this.key);
}

class SearchClearEvent extends LastTimeEvent{}

class AddEvent extends LastTimeEvent{
  final String name;
  final int cycleDays;
  AddEvent({required this.name, required this.cycleDays});
}

class RemoveEvent extends LastTimeEvent{
  final int id;
  RemoveEvent({required this.id});
}

class ActionEvent extends LastTimeEvent{
  final int id;
  final DateTime lastAction;
  ActionEvent({required this.id,required this.lastAction });
}
