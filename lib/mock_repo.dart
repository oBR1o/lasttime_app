import 'package:lasttime/model.dart';
import 'package:lasttime/repo.dart';

class LastTimeMockRepository extends LastTimeRepository{
   List<LastTimeItem> items =[
      LastTimeItem(1, 'ซักผ้า', 7, null,),
      LastTimeItem(2, 'ถูบ้าน', 10, null),
      LastTimeItem(3, 'เปลี่ยนผ้าปูที่นอน', 30, null),
      LastTimeItem(4, 'โทรหาแม่', 3, null),
    ];

    int lastId = 4;

  @override
  Future<List<LastTimeItem>> load() async{
    await Future.delayed(const Duration(seconds: 2));
    items.sort((a,b) => a.cycleDays.compareTo(b.cycleDays));
    return items;
  }
  @override
  Future<List<LastTimeItem>> search(String key) async{
    await Future.delayed(const Duration(seconds: 0));
    return items.where((element) => element.name.contains(key)).toList();
  }

  @override
  Future<void> add({required String name, required int cycleDays}) async{
    await Future.delayed(const Duration(seconds: 0));
    int id =  lastId + 1;
    lastId++;
    LastTimeItem newElement = LastTimeItem(id, name, cycleDays, null);
    items.add(newElement);
  }

  @override
  Future<void> remove({required int id}) async{
    await Future.delayed(const Duration(seconds: 0));
    items.removeWhere((element) => element.id == id);
  } 

  @override
  Future<void> action({required int id,required DateTime lastAction}) async{
    await Future.delayed(const Duration(seconds: 0));
    final index = items.indexWhere((item) => item.id == id);
    items[index] = LastTimeItem(id, items[index].name, items[index].cycleDays, lastAction);
    }
}