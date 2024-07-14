import 'dart:ffi';
import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/models/expense.dart';

import '../mongo/mongo.dart';


class ExpenseController {

  static const collectionName = "Expense";
  static DbCollection expenseCollection = Mongo
      .getCollectionByName(collectionName);

  static void insertExpense(Expense expense) {
    expenseCollection.insertOne({
      "id": Random().nextInt(10000000000),
      "category": expense.category,
      "amount": expense.amount,
      "description": expense.description,
      "day": expense.dateTime.day.toString(),
      "month": expense.dateTime.month.toString(),
      "year": expense.dateTime.year.toString()
    });
  }

  static List getExpenseByYear(int year) {
    var expensesListByYear = [];
    expenseCollection.find({"year":year.toString()}).forEach(
        (expense) => expensesListByYear.add(expensesListByYear)
    );
    return expensesListByYear;
  }

  static List getExpenseByYearAndMonth(int year, int month) {
    var expenseListByMonthAndYear = [];
    expenseCollection.find(
        {"year":year.toString(),
          "month":month.toString()}
    ).forEach((expense) =>
      expenseListByMonthAndYear.add(expense)
    );
    return expenseListByMonthAndYear;
  }

  static List getExpenseByCategory(String category) {
    var expenseListByCategory = [];
    expenseCollection.find({
      "category":category
    }).forEach((expense) => expenseListByCategory.add(expense));
    return expenseListByCategory;
  }
}