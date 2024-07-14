import 'package:lasttime/model.dart';

abstract class LastTimeRepository{
  Future<List<LastTimeItem>> load();
  Future<void> add({required String name, required int cycleDays}); 
  Future<void> remove({required int id,});
  Future<void> action({required int id,required DateTime lastAction});
}