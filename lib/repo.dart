import 'package:lasttime/model.dart';

abstract class LastTimeRepository{
  Future<List<LastTimeItem>> load();
  Future<void> add({required String name, required int cycleDays}); 
}