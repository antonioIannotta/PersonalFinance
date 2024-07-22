import 'dart:ffi';
import 'dart:math';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/models/expense.dart';

import '../../mongo/mongo.dart';


class ExpenseController {

  static const collectionName = "Expense";
  static DbCollection expenseCollection = Mongo
      .getCollectionByName(collectionName);

  static void insertExpense(Expense expense) {
    expenseCollection.insertOne({
      "id": expense.id,
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

  static void updateExpenseAmount(String id, double amount) {
    expenseCollection.updateOne(where.eq("id", id),
        modify.set("amount", amount.toString()));
  }

  static void updateDescription(String id, String description)  {
    expenseCollection.updateOne(where.eq("id", id),
        modify.set("description", description));
  }

  static void updateCategory(String id, String category) {
    expenseCollection.updateOne(where.eq("id", id),
        modify.set("category", category));
  }

  static void updateDate(String id, DateTime dateTime) {
    expenseCollection.updateOne(where.eq("id", id),
        modify.set("day", dateTime.day)
        .set("month", dateTime.month)
        .set("year", dateTime.year)
    );
  }

}