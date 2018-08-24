import 'package:flutter/material.dart';
import 'package:nitdgplug_app/ui/splash_screen/splash_screen.dart';
import 'package:nitdgplug_app/ui/home/home.dart';
import 'package:nitdgplug_app/ui/events/events.dart';
import 'package:nitdgplug_app/ui/news/news.dart';
import 'package:nitdgplug_app/ui/about_us.dart';
import 'package:nitdgplug_app/ui/qrcode_scanner/qrcode_scanner.dart';
//import 'package:nitdgplug_app/ui/credits/credits.dart';

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
        initialRoute: "/ui/home",
        routes: <String, WidgetBuilder>{
          "/ui/home": (BuildContext context) => new HomePage(),
          "/ui/events": (BuildContext context) => new events(),
          "/ui/qrcode_scanner": (BuildContext context) => new QRcodeScanner(),
          "/ui/news": (BuildContext context) => new News(),
          "/ui/about_us": (BuildContext context) => new AboutUs(),
//          "/ui/contact_us": (BuildContext context) => new ContactUs(),
        },
      )
  );
}