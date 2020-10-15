import 'dart:math';
import 'package:flutter/material.dart';

/**
 * @author: Himank Kadian
 * @version: 2020-OCT-02
 * Description: Row and Column widgets app uses one row with
 * 3 columns. All columns have 2 containers with different properties.
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //standard layout till here
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(
              "Row and Column Widgets"), //setting appbar properties and background color
        ),
        body: Row(
          //1 row class that will contain 3 columns.
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Column(    //left most column
                //crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 100.0,
                      width: 100.0,
                      margin: EdgeInsets.only(left: 10),
                      child: Center(
                        child: Text('Container 1'),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        shape: BoxShape.rectangle,                  //box decoration used to set properties of containers.
                        color: Colors.amber,
                      )),
                  Transform.rotate(
                    angle: pi / 4,
                    //rotates the child container at 90 on itself.
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        height: 100.0,
                        width: 100.0,
                        //transform: Matrix4.rotationZ((22 / 7) / 4),
                        child: Center(
                          child: Text('Container 2'),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Column(    //middle column
                children: [
                  Expanded(     //using both containers as expanded
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.yellow,
                      margin: EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.bottomCenter,    //container text align
                          child: Text('Container 3')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.blue,
                        margin: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerRight,   //container text align
                            child: Text('Container 4'))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
              child: Column(
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.fromLTRB(0, 150, 0, 200),    //margin to push con. 5&6 in correct position
                      child: Center(
                          child: Text(
                        'Container 5',
                        style: TextStyle(color: Colors.white),      //style property for text to change text color
                      )),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 3),
                      )),
                  Expanded(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Align(
                                alignment: Alignment.topLeft,   //using Align widget to align the child text
                                child: Text('Con 6',
                                    style: TextStyle(fontSize: 30)))),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * All columns are wrapped in padding of 10 on different required sides.
 * All containers have margin as required. * 
 */