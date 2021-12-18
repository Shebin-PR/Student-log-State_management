import 'package:hive_flutter/hive_flutter.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class Student extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? age;

  @HiveField(2)
  int? phone;

  Student(
    this.name,
    this.age,
    this.phone,
  );
}
