import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_purpose/CounterBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Testing Bloc"),
        ),
        body: BlocProvider(
          create: (context) => CounterBloc(0),
          child: CounterScreen(),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(context) {
    // ignore: close_sinks
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, int state) {
              return Text(
                "Counter value : $state",
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.increment);
                },
                child: Text(
                  "Increment",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {
                  _counterBloc.add(CounterEvents.decrement);
                },
                child: Text(
                  "Decrement",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
