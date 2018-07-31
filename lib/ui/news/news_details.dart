import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

class NewsDetails extends StatefulWidget {

  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final String url;
  NewsDetails({Key key, this.title, this.description, this.imageUrl, this.author, this.url}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(widget.imageUrl, fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  "Author: ${widget.author}",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.85),
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  width: 225.0,
                  height: 1.0,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      height: 1.4,
                      fontSize: 15.0
                  ),
                ),
                
                Padding(padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0)) ,
                RaisedButton(
                  child: Center(
                    child: Text("Read Full Story"),
                  ),
                  onPressed: _launchURL,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    var url = '${widget.url}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

