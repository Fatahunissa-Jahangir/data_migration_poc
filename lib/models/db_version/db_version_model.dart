
import 'package:data_migration_poc/models/db_version/db_version_db_model.dart';

class DbVersionModel {
  String? version;

  DbVersionModel({this.version});

  DbVersionModel toDbModel(DbVersionDBModel dbModel) {
    return DbVersionModel(version: dbModel.version);
  }

  DbVersionDBModel fromDbModel(DbVersionModel model) {
    return DbVersionDBModel(version: model.version);
  }
}