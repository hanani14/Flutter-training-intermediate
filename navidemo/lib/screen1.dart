import 'package:flutter/material.dart';
import 'package:navidemo/screen2.dart';

import 'model/valueobj.dart';

class Screen1 extends StatelessWidget {
   Screen1({Key? key}) : super(key: key);

   final myValue = TextEditingController();

   final myValue2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("screen"),
            TextField(
              controller: myValue,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen2(passObj: ValueObj( myValue.text,myValue2.text))));
              },
              child: Text('Click me '),
            )
          ],
        ),
      )),
    );
  }
}
