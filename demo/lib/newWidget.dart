import 'package:flutter/material.dart';

class NewWiedget extends StatefulWidget {

  @override
  State<NewWiedget> createState() => _NewWiedgetState();
}

class _NewWiedgetState extends State<NewWiedget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Icon(Icons.star),
      ),
    );
  }
}