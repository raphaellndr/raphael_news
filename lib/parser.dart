import 'dart:async';

import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';


class Parser {

  //final url = "https://www.lemonde.fr/ameriques/rss_full.xml";
  final url = "http://www.france24.com/fr/actualites/rss";

  Future loadRSS() async {

    final response = await get(url);

    if(response.statusCode == 200) {
      final feed = RssFeed.parse(response.body);
      print(feed);
    } else {
      print('error: ${response.statusCode}');
    }
  }

}