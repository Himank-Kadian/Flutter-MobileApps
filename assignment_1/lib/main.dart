import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Row and Column Widgets") ,
        ),
        body: Row(children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                child: Text(
                  'Container 1'
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.orange,
                )
              ),
              Container(

              ),
            ],
          ),
          Column(

          ),
          Column(

          ),
        ],
        ),
      ),
    );
  }
}