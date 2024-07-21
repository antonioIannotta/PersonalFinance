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
      "id":Random().nextInt(100000),
      "category":saving.name,
      "target_amount":saving.targetAmount.toString(),
      "actual_amount":0.toString()
    });


  }
}