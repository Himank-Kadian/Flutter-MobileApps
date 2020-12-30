//AlertDialog Widget of the Week
//https://www.youtube.com/watch?v=75CsnyRXf5I&vl=en

//SnackBar Widget of the Week
//https://www.youtube.com/watch?v=zpO6n_oZWw0

import 'package:flutter/material.dart';

class AlertDialogAndSnackBarDemo extends StatelessWidget {
  const AlertDialogAndSnackBarDemo({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          AlertDialogSnackBar(),
        ],
      ),
    );
  }
}

class AlertDialogSnackBar extends StatefulWidget {
  @override
  _AlertDialogSnackBarState createState() => _AlertDialogSnackBarState();
}

class _AlertDialogSnackBarState extends State<AlertDialogSnackBar> {
  @override
  Widget build(BuildContext myScaffoldContext) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: myScaffoldContext,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: Text(
                    'AlertDialog Text',
                  ),
                  content: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.lime,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Some Text',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                        'Ok',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        final snackBar = SnackBar(
                          content: Text(
                            'Snack Bar',
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
                        Scaffold.of(myScaffoldContext).showSnackBar(snackBar);
                      },
                    ),
                  ],
                );
              });
        },
        child: Text(
          'Press Here',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}