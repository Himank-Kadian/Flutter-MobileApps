import 'package:flutter/material.dart';
import 'package:coffee_store_app/widget/StoreHomePage.dart';
import 'package:coffee_store_app/demos/ac_tabbed_page_demo_1.dart';
import 'package:coffee_store_app/demos/ae_tabbed_page_demo_2.dart';
import 'package:coffee_store_app/demos/ag_tabbed_page_demo_3.dart';
import 'package:coffee_store_app/demos/aj_scoped_model_demo_1.dart';
import 'package:coffee_store_app/demos/ak_scoped_model_demo_2.dart';
import 'package:coffee_store_app/demos/ay_AlertDialog_SnackBar_Demo.dart';

// void main() => runApp(
//       MyTabbedScopedModelDemos(),
//     );

void main() => runApp(
      MyApp3(),
    );

class MyTabbedScopedModelDemos extends StatelessWidget {
  final Color themeColor = Color(0xFF808366);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed with Scoped Model Demos',
      theme: ThemeData.light().copyWith(
        brightness: Brightness.light,
        accentColor: Colors.cyan[600],
        primaryColor: themeColor,
        scaffoldBackgroundColor: themeColor,
        indicatorColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 200,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      // home: MyTabbedDemo1(
      //   title: 'Tabbed Demo 1',
      // ),

      // home: MyTabbedDemo2(
      //   title: 'Tabbed Demo 2',
      // ),

      // home: MyTabbedDemo3(
      //   title: 'Tabbed Demo 3',
      // ),

      // home: MyScopedModelDemo1(
      //   myModel: MyCounterModel(),
      //   title: 'Scoped Model Demo 1',
      //   color: themeColor,
      // ),

      // home: MyScopedModelDemo2(
      //   title: 'Scoped Model Demo 2',
      //   color: themeColor,
      // ),

      // home: MyTabbedScopedModelDemo(
      //   title: 'Tabbed Scoped Model Demo',
      //   color: themeColor,
      // ),

      home: AlertDialogAndSnackBarDemo(
        title: 'AlertDialog and SnackBar Demo',
      ),
    );
  }
}