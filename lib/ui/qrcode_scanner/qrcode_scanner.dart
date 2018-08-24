import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import '../widgets.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QRcodeScanner extends StatefulWidget {
  @override
  _QRcodeScannerState createState() => _QRcodeScannerState();
}

class _QRcodeScannerState extends State<QRcodeScanner> {

  String result = "Hey there !";
  final GlobalKey<ScaffoldState> _appBarKey = new GlobalKey<ScaffoldState>();

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _appBarKey,
        drawer: new Widgets(),
        body: Stack(children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.3), BlendMode.dstATop),
                image: new AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  const Color(0xFF000000),
                  const Color(0x00000000),
                ],
              ),
            ),
          ),
          (result.startsWith("http:"))
              ? AlertDialog(
                  title: new Text(
                    'Scanned !',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: new SingleChildScrollView(
                    child:new RaisedButton(
                            onPressed: (() {
                              _launchURL(result);
                              result="";
                              Navigator.of(context).pop();

                            }),
                            elevation: 1.0,
                            child: new Text(
                              "Go to the Link",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                    ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text('Cancel',
                        style: TextStyle(color: Colors.black)
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              :
              Column(
                children: <Widget>[
                  Container(
                    child:Text(
                      "QR Code Scanner",
                      style: new TextStyle(
                                fontSize: 30.0,
                                color: Colors.white
                              ),
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                  ),

                  Container(
                    alignment: Alignment.center,
                    color: Colors.white.withOpacity(0.85),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    width: 225.0,
                    height: 1.0,
                  ),

                  Container(
                    child:Text(
                      "Scan QR Codes to know more abour our events and workshops.",
                      style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
                    child: RaisedButton(
                      child: Text("Scan",
                          style:TextStyle(
                              fontSize: 15.0,
                              color: Colors.white)),
                      elevation: 2.0,
                      splashColor: Colors.white,
                      color: Colors.grey,
                      onPressed: _scanQR,
                    ),
                  ),
                ],
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
        ]
      )
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}