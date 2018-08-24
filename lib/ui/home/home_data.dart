class HomeItem {
  HomeItem({
    this.title,
    this.imageUrl,
    this.route
  });

  final String title;
  final String imageUrl;
  final String route;
}

final sampleItems = <HomeItem> [
  new HomeItem(title: 'Events', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route:'/ui/events'),
  new HomeItem(title: 'News', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/news'),
  new HomeItem(title: 'QR Code Scanner', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route:'/ui/qrcode_scanner'),
  new HomeItem(title: 'About Us', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/about_us')
];

//new HomeItem(title: 'Credits', imageUrl: 'https://www.chicagoentertainmentagency.com/blog/wp-content/uploads/2013/08/events_medium.jpg', route: '/ui/credits')