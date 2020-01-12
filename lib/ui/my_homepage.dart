import '../blocs/counter_bloc.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: _counterBloc.counterStream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return Text(
                snapshot.data.toString(),
                style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counterBloc.addCount(1),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

