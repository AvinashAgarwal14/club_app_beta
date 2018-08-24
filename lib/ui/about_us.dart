import 'package:flutter/material.dart';
import './widgets.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  final GlobalKey<ScaffoldState> _appBarKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _appBarKey,
      drawer: new Widgets(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                  image: new AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              children: <Widget>[

                Padding(padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0)),

                Container(
                  alignment: Alignment.center,
                    child: Text(
                      "About Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    )
                ),

                Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.85),
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  width: 225.0,
                  height: 1.0,
                )
              ],
            ),

            Center(
              child: new Container(
                child: Text(
                  "As self explanatory as our name is, we provide budding enthusiasts like ourselves a forum to contribute and learn about FOSS. Here at GLUG, we believe in freedom of expression for everyone and aim to promote the idea of Open Source to beginners and veterans alike. We strive to elevate the tech culture in our college and believe that can only be done through giving people digital resources and knowledge in all realms, from hardware to software and date to design.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      height: 1.4,
                      fontSize: 15.0
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container (
                margin: EdgeInsets.fromLTRB(4.0, 28.0, 0.0, 0.0),
                child: new IconButton(
                  icon: Icon(Icons.menu)
                  ,
                  color: Colors.white,
                  onPressed: () => _appBarKey.currentState.openDrawer(),
                )
            )
          ],
          )
      )
    );
  }
}