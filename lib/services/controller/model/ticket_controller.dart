import 'package:mongo_dart/mongo_dart.dart';
import 'package:personal_finance/models/ticket.dart';

import '../../mongo/mongo.dart';

class TicketController {

  static const collectionName = "Ticket";
  static DbCollection ticketCollection = Mongo
      .getCollectionByName(collectionName);

  static addTicket(String id, int number) {
    var ticket = _returnTicketById(ticketCollection.find(
      {"id":id}
    ) as Map);
    var actualNumber = number + ticket.number;
    ticketCollection.updateOne(where.eq("id", id),
        modify.set("number", actualNumber));
  }

  static useTicket(String id, int number) {
    var ticket = _returnTicketById(ticketCollection.find(
      {"id":id}
    ) as Map);
    var actualUsed = number + ticket.used;
    ticketCollection.updateOne(where.eq("id", id),
        modify.set("used", actualUsed));
  }

  static Ticket _returnTicketById(Map<dynamic, dynamic> document) {
    return Ticket(document["id"], document["amount"],
        document["number"], document["used"]);
  }

  //TODO: handle the scenario in which the value of the tickets changes
}