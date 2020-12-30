/**
 * @author Himank Kadian
 * @version 2020-NOV-08
 */

import 'package:coffee_store_app/model/DrinkType.dart';
import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:coffee_store_app/widget/StoreHomePage.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinksList extends StatefulWidget {
  @override
  _DrinksListState createState() => _DrinksListState();
}

class _DrinksListState extends State<DrinksList> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModel1>(builder: (context, child, model) {
      return Expanded(
        //GridView children must be a list of widgets.
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(6.0),
          //coffeeTypes is a list of DrinkType objects.
          //DrinkType is a class with properties, title, image file name, price.
          //We transform the coffeTypes list into a new
          //list of DrinksCards using each of coffeTypes DrinkType
          //object data.
          //We use the List.map().toList()
          //method calls from the List class to do this.
          children: model.chosenDrink.map((e) {
            return new GestureDetector(
              //map new list as GestureDetector to add functionality
              //to each item of gridview
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          //display custom alert when item is clicked
                          title: Text("Drink: ${e.title}"),
                          content: Row(
                            children: [
                              Container(
                            width: 250,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('${e.image}'),
                              fit: BoxFit.cover,
                            )
                            ),
                             child: Text("Price: \$${e.price}",
                             style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.white)),
                          )
                            ],
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                final snackBar = SnackBar(
                                  content: Text(
                                    '${e.title} added to cart.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  duration: Duration(
                                    seconds: 2,
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                            )
                          ],
                        );
                      });
                },
                //make DrinksCard the child of GestureDetector to create
                //Cards with added Gesture functionality
                child: DrinksCard(drinkType: e));
            // return DrinksCard(drinkType: e);
          }).toList(),
        ),
      );
    });
  }
}
