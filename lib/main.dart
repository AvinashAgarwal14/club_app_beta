import 'package:flutter/material.dart';
import 'package:nitdgplug_app/ui/splash_screen/splash_screen.dart';
import 'package:nitdgplug_app/ui/home/home.dart';
import 'package:nitdgplug_app/ui/events/events.dart';
import 'package:nitdgplug_app/ui/news/news.dart';

void main() {
  runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            canvasColor: Color.fromRGBO(180,180,180, 0.0),
            textTheme: TextTheme(

            )
        ),
        home: new SplashScreen(),
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          "/ui/home": (BuildContext context) => new HomePage(),
          "/ui/events": (BuildContext context) => new events(),
          "/ui/news": (BuildContext context) => new News(),
//       "/about us": (BuildContext context) => new AboutUsPage(),
//       "/credits": (BuildContext context) => new EventContent(),
        },
      )
  );
}