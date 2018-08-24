import 'package:firebase_database/firebase_database.dart';
import './upcoming.dart';

List recievedEventsList = upcomingEventsList;

class EventItem {

  EventItem(
    this.title,
    this.body,
    this.imageUrl,this.date
  );

  String key;
  String title;
  String body;
  String imageUrl;
  String date;

  EventItem.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        title = snapshot.value['title'],
        body = snapshot.value['body'],
        imageUrl = snapshot.value['imageUrl'],
        date = snapshot.value['date'];
}

final sampleItems = recievedEventsList;