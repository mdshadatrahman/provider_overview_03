import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_03/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Dog>(
      create: (context) => Dog(name: 'Doggy', breed: 'Bulldog', age: 3),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider_overView_02',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider_OverView_02'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${Provider.of<Dog>(context).name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${Provider.of<Dog>(context).breed}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '- age: ${Provider.of<Dog>(context).age}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Provider.of<Dog>(context, listen: false).grow();
            },
            child: Text('Grow'),
          ),
        ],
      ),
    );
  }
}
