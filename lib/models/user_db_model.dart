
import 'package:isar/isar.dart';

part 'user_db_model.g.dart';


@collection 
class UserDBModel {
  Id id = Isar.autoIncrement;

  String? name;
  String? location;
  int? count;

  UserDBModel({this.name, this.location, this.count});

}