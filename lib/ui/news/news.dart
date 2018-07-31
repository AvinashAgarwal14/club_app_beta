import 'package:flutter/material.dart';
import '../news/intro_page_view.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final apiKey = '6f71639a066e4e5daa6021c8dfe07fbf';
List newslist = new List();

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

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

        new FutureBuilder(
            future: _getNews(),
            builder: (BuildContext context, AsyncSnapshot<Map> snapshot ) {
              if (snapshot.hasData)
                return new IntroPageView();
              else
                return new Center(
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
                );
            }),


      ],

    );
  }

  Future<Map> _getNews() async {
    String apiUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';
    http.Response response = await http.get(apiUrl);
    setState(() {
      newslist = json.decode(response.body)["articles"];
    });
    return json.decode(response.body);
  }

}

List sendNewsList() {
  return newslist;
}
