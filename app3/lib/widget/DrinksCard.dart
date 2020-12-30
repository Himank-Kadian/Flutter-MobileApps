/**
 * @author Himank Kadian
 * @version 2020-NOV-08
 */

//Stack Widget of the Week.
//https://www.youtube.com/watch?v=liEGSeD3Zt8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=50

import 'package:flutter/material.dart';
import 'package:coffee_store_app/model/DrinkType.dart';

List<DrinkType> mainTypes = <DrinkType>[
  DrinkType('Coffee', 'assets/img/black-coffee.jpeg', 4.12),
  DrinkType('Tea', 'assets/img/black-tea.jpeg', 4.12),
  DrinkType('Juice', 'assets/img/lemon.jpeg', 4.12),
  DrinkType('Smoothie', 'assets/img/apple-smoothie.jpeg', 4.12),
];

List<DrinkType> coffeeTypes = <DrinkType>[
  DrinkType('Black Coffee', 'assets/img/black-coffee.jpeg', 4.12),
  DrinkType('Cappuccino', 'assets/img/cappuccino.jpeg', 4.12),
  DrinkType('Espresso', 'assets/img/espresso.jpeg', 4.12),
  DrinkType('Latte', 'assets/img/latte.jpeg', 4.12),
];

List<DrinkType> teaTypes = <DrinkType>[
  DrinkType('Black Tea', 'assets/img/black-tea.jpeg', 4.12),
  DrinkType('Brown Tea', 'assets/img/brown-tea.jpeg', 4.12),
  DrinkType('English Tea', 'assets/img/english-tea.jpeg', 4.12),
  DrinkType('Herbal Tea', 'assets/img/herbal-tea.jpeg', 4.12),
  DrinkType('Mint Tea', 'assets/img/mint-tea.jpeg', 4.12),
];

List<DrinkType> juiceTypes = <DrinkType>[
  DrinkType('Lemon Juice', 'assets/img/lemon.jpeg', 4.12),
  DrinkType('Lime Juice', 'assets/img/lime.jpeg', 4.12),
  DrinkType('Pink Grape Juice', 'assets/img/pink-grape.jpeg', 4.12),
  DrinkType('Plum Juice', 'assets/img/plum.jpeg', 4.12),
  DrinkType('Tomato Juice', 'assets/img/tomato.jpeg', 4.12),
];

List<DrinkType> smoothieTypes = <DrinkType>[
  DrinkType('Apple Smoothie', 'assets/img/apple-smoothie.jpeg', 4.12),
  DrinkType('Blackberry Smoothie', 'assets/img/black-smoothie.jpeg', 4.12),
  DrinkType('Kiwi Fruit Smoothie', 'assets/img/kiwi-smoothie.jpeg', 4.12),
  DrinkType('Raspberry Smoothie ', 'assets/img/rasberry-smoothie.jpeg', 4.12),
];

class DrinksCard extends StatelessWidget {
  const DrinksCard({this.drinkType});

  final DrinkType drinkType;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        //Stack widget is used to place the title
        //on top of the image.
        child: Stack(
          children: <Widget>[
            Image.asset(
              //Each DrinksCard will have an image.
              drinkType.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //Each DrinksCard will have a title.
                  drinkType.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}