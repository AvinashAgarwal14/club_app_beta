import 'package:flutter/material.dart';
import './upcoming_events_data.dart';
import './upcoming_events_page_item.dart';
import './upcoming_events_page_transformer.dart';
import './upcoming.dart';

class UpcomingEventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size:const Size.fromHeight(500.0),
          child: (upcomingEventsList.length!=0)? PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.90),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return UpcomingEventItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ): new Center(
                  child:
                      Padding(padding: EdgeInsets.only(top: 200.0),
                          child: Text("No Upcomung Events. \n Tune in for Updates!",
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                      ),
                  )
        ),
      )
    );
  }
}
