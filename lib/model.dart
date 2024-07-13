import 'package:equatable/equatable.dart';

class LastTimeItem extends Equatable{
  final int id;
  final String name;
  final int cycleDays;
  final DateTime? lastAction;

  const LastTimeItem(this.id,this.name,this.cycleDays,this.lastAction,);
  
  @override
  List<Object?> get props => [id, lastAction];
}