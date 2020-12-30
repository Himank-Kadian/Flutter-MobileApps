//This app demonstrates the use of the ScopedModel package
//that looks after the state management for the app.

//ScopedModel by whatsupcoders.
//https://www.youtube.com/watch?v=kpOT4OTzKLU

//scoped model by the flutter community.
//https://medium.com/@soonsantos/how-to-use-scopedmodel-in-flutter-f4178a728f99

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class MyScopedModelDemo1 extends StatelessWidget {
  MyScopedModelDemo1({@required this.myModel, this.title, this.color});

  final MyCounterModel myModel;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    //At the top level of our app, we'll, create a ScopedModel Widget.
    //This will provide the MyCounterModel to all
    //children in the app that request it
    //using a ScopedModelDescendant.
    return ScopedModel<MyCounterModel>(
        model: myModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Times button has been pushed:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                //Create a ScopedModelDescendant. This widget will get the
                //MyCounterModel from the nearest parent ScopedModel<CounterModel>
                //model property.
                //It will hand that MyCounterModel to our builder method,
                //via the model parm of the anonymous funciton, and
                //rebuild any time the MyCounterModel changes (i.e. after we
                //notifyListeners in the Model).
                ScopedModelDescendant<MyCounterModel>(
                  builder: (contextParm, childParm, modelParm) {
                    return Text(
                      modelParm.counter.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Use the ScopedModelDescendant again in order to use the increment
          // method from the MyCounterModel
          floatingActionButton: ScopedModelDescendant<MyCounterModel>(
            builder: (contextParm, childParm, modelParm) {
              return FloatingActionButton(
                backgroundColor: Colors.black,
                //Address of the model.increment method from the
                //MyCounterModel class.
                onPressed: modelParm.increment,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
        ));
  }
}

// Start by creating a class that has a counter and a method to increment it.
// Note: It must inheirit from Model.
class MyCounterModel extends Model {
  //Private field.
  int _counter = 0;
  //Public property.
  int get counter => _counter;

  void increment() {
    //Increment the counter
    _counter++;

    //The notifyListeners method comes from the
    //base Model of the ScopedModel package.
    notifyListeners();
  }
}
