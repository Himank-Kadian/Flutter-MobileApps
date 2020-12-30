//This app demonstrates the TabController,
//TabBar, and TabBarView Widgets.
//When we use the TabController we have to initialize
//early in the lifecycle of the Stateful widget.
//The app also uses the List.map().toList() methods
//to convert a simple list into TabBar and TabView
//widgets.
//It also shows the use of mixins, but we will talk
//about that later.
//Also how to pass parms down the stateful widget tree.

//lifecycle explained from flutter community.
//https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

//Why not to use the DefaultTabController by medium
//https://medium.com/flutterworld/flutter-tabbar-and-tricks-4f36e06025a4

import 'package:flutter/material.dart';

class MyTabbedDemo2 extends StatefulWidget {
  MyTabbedDemo2({this.title, this.color});

  final String title;
  final Color color;
  @override
  _MyTabbedDemo2State createState() => _MyTabbedDemo2State();
}

class _MyTabbedDemo2State extends State<MyTabbedDemo2>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //Instantiation of a TabController.
    //length must not be neg, zero, or null.
    //The vsync property is associated with the SingleTickerProviderStateMixin.
    //This has to do with the animations but we will cover later.
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String myTitle = widget.title;
    Color myColor = widget.color;

    return Scaffold(
      backgroundColor: myColor,
      appBar: AppBar(
        title: Text(myTitle),
        bottom: TabBar(
          //This TabBar uses the TabController.
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: myTabs.map((Tab tab) {
            return Text(
              tab.text,
              style: TextStyle(fontSize: 36),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        //This TabBarView uses the TabController.
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
