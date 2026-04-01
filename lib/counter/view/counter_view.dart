import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter/viewmodels/counter_viewmodel.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewmodel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Counter",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Counter : "),
                Text(
                  counterViewModel.counter.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            FloatingActionButton(onPressed: () {
              counterViewModel.decrement();
            }, child: Icon(Icons.minimize)),
            SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                counterViewModel.increment();
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
