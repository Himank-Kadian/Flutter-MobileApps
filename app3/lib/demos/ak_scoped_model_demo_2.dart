import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyCounter {
  int count = 1;
}

class MyScopedCounter extends Model {
  MyCounter counter1 = MyCounter();
  MyCounter counter2 = MyCounter();
  MyCounter counter3 = MyCounter();

  increment() {
    counter1.count += 1;
    counter2.count += 5;
    counter3.count += 10;

    notifyListeners();
  }
}

class MyScopedModelDemo2 extends StatelessWidget {
  MyScopedModelDemo2({this.title, this.color});

  final String title;
  final Color color;

  final MyScopedCounter myScopedCounter = MyScopedCounter();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyScopedCounter>(
      model: myScopedCounter,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Widget1(),
              Widget2(),
              Widget3(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => myScopedCounter.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext ctext) {
    return ScopedModelDescendant<MyScopedCounter>(
        builder: (context, child, myModel) => Text(
              'Widget1 counter is ${myModel.counter1.count}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ));
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctext) {
    return ScopedModelDescendant<MyScopedCounter>(
        builder: (context, child, myModel) => Text(
              'Widget2 counter is ${myModel.counter2.count}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ));
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext ctext) {
    return ScopedModelDescendant<MyScopedCounter>(
        builder: (context, child, myModel) => Text(
              'Widget3 counter is ${myModel.counter3.count}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ));
  }
}
