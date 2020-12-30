import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:coffee_store_app/widget/DrinksCarousel.dart';
import 'package:coffee_store_app/widget/DrinksList.dart';
import 'package:flutter/material.dart';
import 'package:coffee_store_app/model/DrinkType.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreHomePage(title: 'App3 Tab Controls with ScopedModel'),
    );
  }
}

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyModel1>(
      model: MyModel1(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            DrinksCarousel(),
            DrinksList(),
          ],
        ),
      ),
    );
  }
}

class MyModel1 extends Model {
  //This is a private field.
  List<DrinkType> _chosenDrink = coffeeTypes;
  //This is a public properties getter.
  List<DrinkType> get chosenDrink => _chosenDrink;
  //This is a public properties setter.
  set chosenDrink(List<DrinkType> type) {
    _chosenDrink = type;
    //This is called whenever something is changed.
    notifyListeners();
  }
}
