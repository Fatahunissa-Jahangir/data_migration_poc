import 'package:data_migration_poc/local_storage.dart';
import 'package:data_migration_poc/models/db_transaction/db_transaction_db_model.dart';
import 'package:data_migration_poc/models/db_version/db_version_db_model.dart';
import 'package:data_migration_poc/models/user_db_model.dart';
import 'package:isar/isar.dart';

Future<void> performMigrationV2() async { 
  print("migration v2 called");

  await LocalStorage.isar.writeTxn(() async {
    final userModel = await LocalStorage.isar.userDBModels.where().findAll();
    for (final user in userModel) {
      final userdetail = await LocalStorage.isar.userDBModels.get(user.id);
      if(userdetail != null){ 
        userdetail.count = 0;
        await LocalStorage.isar.userDBModels.put(userdetail);
      }
    }
    await LocalStorage.isar.dbVersionDBModels.put(DbVersionDBModel(version: 'V2'));
    await LocalStorage.isar.dbTransactionDBModels.put(DbTransactionDBModel(transactionName: 'performMigrationV2', transactionDate: DateTime.now().toString()));
    print("migration V2 done");
  });
}