import 'package:flutter/material.dart';
import './home_data.dart';
import './home_page_item.dart';
import './homepage_transformer.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(sampleItems.length);
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size:const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.90),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return HomePageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
