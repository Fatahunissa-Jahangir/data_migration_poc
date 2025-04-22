import 'package:data_migration_poc/models/db_transaction/db_transaction_db_model.dart';

class DbTransactionModel {
  String? transactionName;
  String? transactionDate;

  DbTransactionModel({this.transactionName, this.transactionDate});

  DbTransactionModel toDbModel(DbTransactionDBModel dbModel) {
    return DbTransactionModel(transactionName: dbModel.transactionName, transactionDate: dbModel.transactionDate);
  }

  DbTransactionDBModel fromDbModel(DbTransactionModel model) {
    return DbTransactionDBModel(transactionName: model.transactionName, transactionDate: model.transactionDate);
  }
}