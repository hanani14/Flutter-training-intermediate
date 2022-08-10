import 'package:flutter/material.dart';
import 'package:navidemo/screen1.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 3'),
        ),
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go to Screen 2')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Screen1()),
                        (route) => false);
                    Navigator.pushNamed(context, '/second');
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text('Go to Screen 2')),
            ],
          )),
        ));
  }
}
