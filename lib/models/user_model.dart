import 'package:data_migration_poc/models/user_db_model.dart';

class UserModel { 
  String? name;
  String? location;

  UserModel({this.name, this.location});

  UserModel toDbModel(UserDBModel dbModel) {
    return UserModel(name: dbModel.name, location: dbModel.location);
  }

  UserDBModel fromDbModel(UserModel model) {
    return UserDBModel(name: model.name, location: model.location);
  }
}