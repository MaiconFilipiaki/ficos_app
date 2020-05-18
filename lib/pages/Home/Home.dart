import 'package:ficos_app/pages/Announcement/Announcement.dart';
import 'package:ficos_app/pages/MyAnnouncements/MyAnnouncements.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
    _controller.addListener(() {
      if (_controller.index == 1 || _controller.index == 2) {
        _controller.index = 0;
        Navigator.pushNamed(context, "/login");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new TabBarView(
          controller: _controller,
          children: <Widget>[
            new Announcement(),
            new MyAnnouncements(),
            new Announcement(),
            new MyAnnouncements(),
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.black,
        child: new TabBar(
          controller: _controller,
           indicatorColor: Colors.white,
           tabs: <Tab>[
             new Tab(icon: new Icon(Icons.home)),
             new Tab(icon: new Icon(Icons.chat)),
             new Tab(icon: new Icon(Icons.edit)),
             new Tab(icon: new Icon(Icons.people)),
           ]
        ),
      ),

    );
  }
}
