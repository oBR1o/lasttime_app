import 'package:lasttime/model.dart';
import 'package:lasttime/repo.dart';

class LastTimeMockRepository extends LastTimeRepository{
  @override
  Future<List<LastTimeItem>> load() async{
    await Future.delayed(const Duration(seconds: 2));
    List<LastTimeItem> items =[
      const LastTimeItem(1, 'ซักผ้า', 7, null),
      const LastTimeItem(2, 'ถูบ้าน', 10, null),
      const LastTimeItem(3, 'เปลี่ยนผ้าปูที่นอน', 30, null),
      const LastTimeItem(4, 'โทรหาแม่', 3, null),
    ];

    items.sort((a,b) => a.cycleDays.compareTo(b.cycleDays));

    return items;
  }

}