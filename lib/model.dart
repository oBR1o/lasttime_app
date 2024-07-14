import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable{
  final int id;
  final String name;
  final int cycleDays;
  final DateTime? lastAction;
  final DateTime? nextAction;

  LastTimeItem(this.id, this.name, this.cycleDays, this.lastAction)
      : nextAction = lastAction != null
            ? lastAction.add(Duration(days: cycleDays))
            : DateTime.now().add(Duration(days: cycleDays));
  
  @override
  List<Object?> get props => [id, lastAction];
}