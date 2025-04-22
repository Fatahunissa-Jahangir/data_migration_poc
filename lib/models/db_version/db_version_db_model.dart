import 'package:isar/isar.dart';

part 'db_version_db_model.g.dart';

@Collection()
class DbVersionDBModel{ 
  Id id = 1;
  String? version;

  DbVersionDBModel({this.version});
}