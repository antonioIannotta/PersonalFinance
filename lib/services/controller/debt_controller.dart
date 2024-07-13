import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/models/category/debt_category.dart';
import 'package:personal_finance/services/mongo/mongo.dart';

import '../../models/debt.dart';

class DebtController {

  static const collectionName = "Debt";
  static DbCollection debtCollection = Mongo.getCollectionByName(collectionName);

  static void insertDebt(Debt debt) {
    debtCollection.insertOne({
      "_id":Random.secure().nextInt(1000000000000000),
      "original_amount":debt.originalAmount.toString(),
      "remaining_amount":debt.remainingAmount.toString(),
      "remaining_instalments":debt.remainingInstalments.toString(),
      "instalments_amount": debt.instalmentAmount.toString(),
      "description":debt.description.toLowerCase(),
      "debt_category":debt.debtCategory.toString().toLowerCase(),
      "payments_date":debt.paymentsDate
    });
  }

  static Debt retrieveDebtByCategory(String category) {
    return _returnDebtFromDocument(debtCollection.find({"category":category}) as Map);
  }

  static Debt _returnDebtFromDocument(Map<dynamic, dynamic> document) {
    return Debt(double.parse(document["original_amount"]!),
        double.parse(document["remaining_amount"]!.toString()),
        int.parse(document["remaining_instalments"]!.toString()),
        document["description"]!.toString(),
        DebtCategory.returnCategoryFromString(document["debt_category"]!),
        Map<String, DateTime>.from(document["payments_date"]!).cast<DateTime, double>(),
        double.parse(document["instalments_amount"]!));
  }
}