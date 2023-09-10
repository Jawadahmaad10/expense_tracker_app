import 'package:hive/hive.dart';

//In this class when somebody adds data we are simply going to add data to a box
class DbHelper {
  late Box box;

  DbHelper() {
    OpenBox();
  }

  OpenBox() {
    box = Hive.box('money');
  }

  Future<void> addData(
      int amount, DateTime date, String note, String type) async {
    var value = {
      'amount': amount,
      'date': date,
      'type': type,
      'note': note,
    };

    box.add(value);
  }

  Future<Map> fetch() {
    if (box.values.isEmpty) {
      return Future.value();
    } else {
      return Future.value(box.toMap());
    }
  }
}
