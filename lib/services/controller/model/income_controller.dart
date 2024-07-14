import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';

import '../../../models/income.dart';
import '../../mongo/mongo.dart';

class IncomeController {

  static const collectionName = "Income";
  static DbCollection incomeCollection = Mongo
      .getCollectionByName(collectionName);

  static void insertIncome(Income income) {
    incomeCollection.insertOne({
      "id": Random().nextInt(10000000000),
      "category": income.category,
      "amount": income.amount,
      "description": income.description,
      "day": income.dateTime.day.toString(),
      "month": income.dateTime.month.toString(),
      "year": income.dateTime.year.toString()
    });
  }

  static List getIncomeByYear(int year) {
    var incomeListByYear = [];
    incomeCollection.find({"year":year.toString()}).forEach(
        (income) => incomeListByYear.add(income)
    );
    return incomeListByYear;
  }

  static List getIncomeByYearAndMonth(int year, int month) {
    var incomeListByYearAndMonth = [];
    incomeCollection.find({"year":year.toString(),"month":month.toString()})
    .forEach((income) => incomeListByYearAndMonth.add(income));
    return incomeListByYearAndMonth;
  }

}