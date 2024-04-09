import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final BehaviorSubject<int> _counterSubject = BehaviorSubject<int>.seeded(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reactive'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterSubject.stream,
          builder: (context, snapshot) {
            return Text('Counter: ${snapshot.data}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterSubject.add(_counterSubject.value + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _counterSubject.close();
    super.dispose();
  }
}
