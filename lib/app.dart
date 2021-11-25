import 'package:flutter/material.dart';
import 'package:toriyose_app/page/feed_page.dart';

import 'config/constant.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('お取り寄せ'),
          backgroundColor: const Color.fromARGB(255, 247, 85, 25),
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              Container(
                constraints: const BoxConstraints(maxHeight: 150.0),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: const Color.fromARGB(255, 247, 85, 25),
                    isScrollable: true,
                    tabs: genreTabs.map(
                      (Tab tab) {
                        return SizedBox(
                          width: 100.0,
                          child: Tab(
                            child: Text(
                              tab.text ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _getTabs(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getTabs() {
    List<Widget> list = genreTabs.map((Tab tab) {
      int index = genreTabs.indexOf(tab);
      int genreId = genreIds[index];
      return FeedPage(genreId: genreId);
    }).toList();
    return list;
  }
}
