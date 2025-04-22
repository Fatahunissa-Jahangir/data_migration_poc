import 'package:isar/isar.dart';

part 'db_transaction_db_model.g.dart';

@Collection()
class DbTransactionDBModel {
  Id id = 1;
  String? transactionName;
  String? transactionDate;

  DbTransactionDBModel({this.transactionName, this.transactionDate});
}