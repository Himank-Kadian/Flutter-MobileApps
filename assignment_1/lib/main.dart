import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Row and Column Widgets"),
        ),
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      height: 100.0,
                      width: 100.0,
                      child: Center(
                        child: Text('Container 1'),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        shape: BoxShape.rectangle,
                        color: Colors.amber,
                      )),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      height: 100.0,
                      width: 100.0,
                      transform: Matrix4.rotationZ((22 / 7) / 4),
                      child: Center(
                        child: Text('Container 2'),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.yellow,
                      margin: EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.bottomCenter,
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
                            alignment: Alignment.centerRight,
                            child: Text('Container 4'))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Text(
                        'Container 5',
                        style: TextStyle(color: Colors.white),
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
                            child: Text(
                          'CON 6',
                          style: TextStyle(fontSize: 30),
                        )),
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
