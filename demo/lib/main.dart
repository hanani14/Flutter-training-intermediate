import 'package:demo/newWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List fruits = ['Banna', 'apple', 'durian'];

  Widget onFruits() {
    return Container(child: Text('cherry'),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: ListView.builder(
              itemCount: fruits.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(fruits[index]),
                    subtitle: const Text('Subtitle'),
                    trailing: Icon(Icons.arrow_forward ),
                    onTap: () {},
                  ),
                );
              }))),
    );
  }
}

class NewIcons extends StatelessWidget {
  const NewIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.abc_outlined );
  }
}
