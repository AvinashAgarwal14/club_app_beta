class IntroItem {
  IntroItem({
    this.title,
    this.imageUrl,
    this.route
  });

  final String title;
  final String imageUrl;
  final String route;
}

final sampleItems = <IntroItem> [
  new IntroItem(title: 'Events', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route:'/ui/events'),
  new IntroItem(title: 'News', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/news'),
  new IntroItem(title: 'QR Code Scanner', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route:'/ui/news'),
  new IntroItem(title: 'About Us', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/news'),
  new IntroItem(title: 'Credits', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/news')
];
