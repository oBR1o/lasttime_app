import 'package:lasttime/model.dart';

abstract class LastTimeRepository{
  Future<List<LastTimeItem>> load();
}