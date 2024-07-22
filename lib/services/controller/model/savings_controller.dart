import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';

import '../../../models/saving.dart';
import '../../mongo/mongo.dart';

class SavingsController {

  static const collectionName = "Savings";
  static DbCollection savingCollection = Mongo
      .getCollectionByName(collectionName);


  static void insertNewSaving(Saving saving) {
    savingCollection.insertOne({
      "id":saving.id,
      "category":saving.name,
      "target_amount":saving.targetAmount.toString(),
      "actual_amount":0.toString()
    });
  }

  static void addAmountToSaving(String id, double amount) {
    var saving = _returnSavingById(savingCollection.find(
      {"id":id}
    ) as Map);

    var actualAmount = saving.actualAmount + amount;
    savingCollection.updateOne(where.eq("id", id), modify
        .set("actual_amount", actualAmount));
  }

  static Saving _returnSavingById(Map<dynamic, dynamic> savingDocument) {
    return Saving(
      savingDocument["id"]!,
      savingDocument["name"]!,
      double.parse(savingDocument["target_amount"]!),
      double.parse(savingDocument["actual_amount"]!)
    );
  }

}