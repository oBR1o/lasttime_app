import 'package:lasttime/model.dart';

abstract class LastTimeRepository{
  Future<List<LastTimeItem>> load();
  Future<List<LastTimeItem>> search(String key);
  Future<void> add({required String name, required int cycleDays}); 
  Future<void> remove({required int id,});
  Future<void> action({required int id,required DateTime lastAction});
}