import 'package:hive_flutter/hive_flutter.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class Student extends HiveObject {
  @HiveField(0)
  dynamic name;

  @HiveField(1)
  dynamic age;

  @HiveField(2)
  dynamic phone;

  @HiveField(3)
  dynamic imagepath;

  Student({
    required this.name,
    required this.age,
    required this.phone,
    this.imagepath,
  });
}
