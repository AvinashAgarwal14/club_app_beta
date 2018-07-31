import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {

  Icon menuIcon(IconData abc)
  {
    return new Icon(abc,
      color: Colors.white,
      size: 18.0,
    );
  }
  final menuData= new TextStyle(
    fontSize: 18.0,
    fontFamily: 'roboto',
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
          new Center(
            child: new ListTile(
                title: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Image.asset("images/logo.png"),
                  radius: 45.0,
                ),
              subtitle: new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text("GNU Linux User's Group",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            )
          ),
          new  ListTile(
            leading: menuIcon(Icons.event) ,
            title: new Text(
              "Events",style: menuData,),
            trailing: menuIcon(Icons.navigate_next),
            onTap:(){
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/ui/events");

            } ,
          ),
          new  ListTile(
              leading:menuIcon(Icons.update) ,
              title: new Text(
                "News",style: menuData,),
              trailing: menuIcon(Icons.navigate_next),
              onTap:(){

                 Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/ui/news");
              }
          ),

          new  ListTile(
              leading: menuIcon(Icons.update),
              title: new Text(
                "About us",style: menuData,),
              trailing: menuIcon(Icons.navigate_next ),
                        onTap:(){
             Navigator.of(context).pop();

              Navigator.of(context).pushNamed("/ui/news");
              }
          ),

          new  ListTile(
            leading: menuIcon(Icons.accessibility, ) ,
            title: new Text(
              "Credits",style: menuData,),
            trailing:menuIcon(Icons.navigate_next),
              onTap:(){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/ui/news");
              }
          )

        ],
      ),
      elevation: 1.0,
    );
  }
}

