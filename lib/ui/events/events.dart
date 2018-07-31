import 'package:flutter/material.dart';
import '../widgets.dart';
import './upcoming_events/upcoming.dart';
import './previous_events/previous.dart';

class events  extends StatefulWidget {

  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> with SingleTickerProviderStateMixin{

  TabController _eventsTab;

  @override
  void initState() {
    // TODO: implement i/intro_page_view.dartnitState
    super.initState();
    _eventsTab=new TabController(length:2, vsync:this, initialIndex:0);
  }


  @override
  void dispose(){
    _eventsTab.dispose();
    super.dispose();

  }

  final List<Tab> myTabs = <Tab>[
    new Tab(child: new Text(
      "Upcoming",
     ),
    ),
    new Tab(child: new Text(
      "Previous",
    ),),
  ];


  @override
  Widget build(BuildContext context) {
      return Scaffold(

         drawer: new Widgets(),
          body: Container(
            child:Stack(
              children:<Widget>[

                TabBarView(controller: _eventsTab,
                      children: <Widget>[
                     new Upcoming(),
                    new Previous()
                    ]
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 0.0),
                    child: TabBar(controller: _eventsTab, tabs: myTabs,
                    indicatorColor: Colors.black54),
                  ),
                    ]
            ),
          )
      );
  }
}
