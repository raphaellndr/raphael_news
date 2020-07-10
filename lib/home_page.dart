import 'package:flutter/material.dart';

import 'package:webfeed/webfeed.dart';

import 'package:raphael_news/parser.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  RssFeed feed;

  @override
  void initState() {
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

  Future<Null> parse() async {

    RssFeed received = await Parser().loadRSS();
    
    if(received != null) {
      setState(() {
        feed = received;
        print(feed.items.length);
      });
    }
  }
}