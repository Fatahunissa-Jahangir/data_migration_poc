import 'package:data_migration_poc/models/user_db_model.dart';

class UserModel { 
  String? name;
  String? location;
  int? count;

  UserModel({this.name, this.location, this.count});

  UserModel toDbModel(UserDBModel dbModel) {
    return UserModel(name: dbModel.name, location: dbModel.location, count: dbModel.count);
  }

  UserDBModel fromDbModel(UserModel model) {
    return UserDBModel(name: model.name, location: model.location, count: model.count);
  }
}