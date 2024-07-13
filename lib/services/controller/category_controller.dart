import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/services/mongo/mongo.dart';

class CategoryController {

  static const String collectionName = "Category";
  static DbCollection categoryCollection = Mongo.getCollectionByName(collectionName);

  static List<String> getCategories() {
    List<String> categoryList = [];
    categoryCollection.find().forEach((category) =>
        categoryList.add(category.toString())
    );
    return categoryList;
  }

  static addCategory(String category) {
    categoryCollection.insertOne({"category": category});
  }
}