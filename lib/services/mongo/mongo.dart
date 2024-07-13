import 'package:mongo_dart/mongo_dart.dart';

class Mongo {

  static const String mongoUri = "mongodb://localhost:27017";
  static const String dbName = "financeManagement";

  static Db get mongoDatabase => Db(mongoUri);

  static DbCollection getCollectionByName(String collectionName) {
    return mongoDatabase.collection(collectionName);
  }

}