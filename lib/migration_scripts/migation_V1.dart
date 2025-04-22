// ignore: file_names
import 'package:data_migration_poc/local_storage.dart';
import 'package:data_migration_poc/models/db_transaction/db_transaction_db_model.dart';
import 'package:data_migration_poc/models/db_version/db_version_db_model.dart';

Future<void> performMigrationV1() async { 
  print("migration v1 called");
  await LocalStorage.isar.writeTxn(() async {
    await LocalStorage.isar.dbVersionDBModels.put(DbVersionDBModel(version: 'V1'));
    await LocalStorage.isar.dbTransactionDBModels.put(DbTransactionDBModel(transactionName: 'performMigrationV1', transactionDate: DateTime.now().toString()));
    print("migration V1 done");
  });
}