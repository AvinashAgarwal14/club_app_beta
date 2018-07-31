import 'package:firebase_database/firebase_database.dart';
import './previous.dart';

List recievedEventsList = previousEventsList;

class IntroItem {

  IntroItem(
      this.title,
      this.body,
      this.imageUrl,this.date
      );

  String key;
  String title;
  String body;
  String imageUrl;
  String date;

  IntroItem.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        title = snapshot.value['title'],
        body = snapshot.value['body'],
        imageUrl = snapshot.value['imageUrl'],
        date = snapshot.value['date'];
}

final sampleItems = recievedEventsList;