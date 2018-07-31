import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './data.dart';
import './intro_page_view.dart';
import 'package:intl/intl.dart';

List<IntroItem> previousEventsList;

class Previous extends StatefulWidget {
  @override
  _PreviousState createState() => _PreviousState();
}

class _PreviousState extends State<Previous> {

  IntroItem event;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      previousEventsList = new List();
      event = new IntroItem("", "","","");
      databaseReference = database.reference().child("Events");
      databaseReference.onChildAdded.listen(_onEntryAdded);
      databaseReference.onChildChanged.listen(_onEntryChanged);
    }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
            child: (previousEventsList.length!=0)?
            new IntroPageView():
            new Center(
                child: Stack(
                  children: <Widget>[
                    new Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              const Color(0xFF000000),
                              const Color(0x00000000),
                            ],
                          ),
                        )
                    ),
                    Center(
                      child: new Container(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    )
                  ],
                )
            )
        )
      ],
    );
  }

  void _onEntryAdded(Event event) {

    String date = event.snapshot.value['date'];
    int dayEvent = int.parse(date.substring(0,2));
    int monthEvent = int.parse(date.substring(3,5));
    int yearEvent = int.parse(date.substring(6));
    var now = new DateTime.now();
    int dayNow = int.parse(new DateFormat('d').format(now));
    int monthNow = int.parse(new DateFormat('M').format(now));
    int yearNow = int.parse(new DateFormat('y').format(now));
    DateTime dateNow = new DateTime(yearNow, monthNow, dayNow);
    DateTime eventDate = new DateTime(yearEvent, monthEvent, dayEvent);
    Duration difference = eventDate.difference(dateNow);

    setState(() {
      if(difference.inDays<0)
        previousEventsList.add(IntroItem.fromSnapshot(event.snapshot));
    });
  }


  void _onEntryChanged(Event event) {
    var oldEntry = previousEventsList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      previousEventsList[previousEventsList.indexOf(oldEntry)] = IntroItem.fromSnapshot(event.snapshot);
    });

  }

}
