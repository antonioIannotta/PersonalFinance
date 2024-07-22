import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/models/category/debt_category.dart';
import 'package:personal_finance/services/mongo/mongo.dart';

import '../../../models/debt.dart';

class DebtController {

  static const collectionName = "Debt";
  static DbCollection debtCollection = Mongo
      .getCollectionByName(collectionName);

  static void insertDebt(Debt debt) {
    debtCollection.insertOne({
      "_id":debt.id,
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
    return _returnDebtFromDocument(debtCollection
        .find({"category":category}) as Map);
  }

  static void payInstalments(int numberInstalments, String debtCategory,
      DateTime dateTime) {
    var debt = retrieveDebtByCategory(debtCategory);
    double paymentAmount = debt.instalmentAmount * numberInstalments;
    debt.remainingAmount = debt.remainingAmount - paymentAmount;
    debt.remainingInstalments = debt.remainingInstalments - numberInstalments;
    debt.instalmentAmount = (debt.remainingAmount / debt.remainingInstalments);
    var updateMap = debt.paymentsDate;
    updateMap[dateTime] = paymentAmount;

    debtCollection.updateOne(where.eq("id",
        debt.id),
        modify.set("payments_date", updateMap)
        .set("remaining_amount", debt.remainingAmount)
        .set("remainingInstalments", debt.remainingInstalments)
        .set("instalment_amount", debt.instalmentAmount));
  }



  static Debt _returnDebtFromDocument(Map<dynamic, dynamic> document) {
    return Debt(document["id"],double.parse(document["original_amount"]!),
        double.parse(document["remaining_amount"]!.toString()),
        int.parse(document["remaining_instalments"]!.toString()),
        document["description"]!.toString(),
        DebtCategory.returnCategoryFromString(document["debt_category"]!),
        Map<String, DateTime>.from(document["payments_date"]!)
            .cast<DateTime, double>(),
        double.parse(document["instalments_amount"]!));
  }
}