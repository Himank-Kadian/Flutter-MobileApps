/**
 * @author Himank Kadian
 * @version 2020-NOV-08
 */

import 'package:coffee_store_app/widget/DrinksCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';
import 'StoreHomePage.dart';
import 'DrinksCard.dart';

class DrinksCarousel extends StatefulWidget {
  DrinksCarousel({this.color});

  final Color color;

  @override
  _DrinksCarouselState createState() => _DrinksCarouselState();
}

class _DrinksCarouselState extends State<DrinksCarousel>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  //required code for carousel animation

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: mainTypes.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _changeImage({int delta}) {
    var newTabIndex = _tabController.index + delta;
    if (newTabIndex >= mainTypes.length) {
      newTabIndex = 0;
    } else if (newTabIndex < 0) {
      newTabIndex = mainTypes.length - 1;
    }
    _tabController.animateTo(
      newTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = widget.color;

    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4.0,
            color: Colors.black,
          ),
        ),
        child: Stack(children: <Widget>[
          ScopedModelDescendant<MyModel1>(builder: (context, child, myModel) {
            return TabBarView(
              controller: _tabController,
              children: mainTypes.map((e) {
                //map list of drinks, add custom logic, print out as new list.
                return GestureDetector(
                  onTap: () {
                    var myType;
                    //sort images to display on carousel
                    switch (e.title) {
                      case 'Coffee':
                        myType = coffeeTypes;
                        break;
                      case 'Tea':
                        myType = teaTypes;
                        break;
                      case 'Juice':
                        myType = juiceTypes;
                        break;
                      case 'Smoothie':
                        myType = smoothieTypes;
                        break;
                      default:
                        throw '${e.title} type not recognized';
                    }
                    myModel.chosenDrink = myType;
                  },
                  child: DrinksCard(
                    drinkType: e,
                  ),
                );
              }).toList(),
            );
          }),
          Align(
            //stack TabPageSelector on top of carousel
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TabPageSelector(
                  controller: _tabController,
                  color: Colors.white,
                  selectedColor: myColor,
                  indicatorSize: 20,
                ),
              ),
            ),
            Align(
              //stack left and right arrows with functionality on top of carousel
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: -1);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: 1);
                },
              ),
            ),
        ]),
      ),
    );
  }
}