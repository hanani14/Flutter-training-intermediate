import 'package:flutter/material.dart';
import 'package:navidemo/model/valueobj.dart';
import 'package:navidemo/screen3.dart';

class Screen2 extends StatelessWidget {

  Screen2({Key? key,required  this.passObj}) : super(key: key);
  final ValueObj passObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scrrren 2'),
        ),
        body: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen2 ${this.passObj}'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen3(),
                          settings: RouteSettings(name: "/Screen2"),
                        ));
                  },
                  child: Text('Go to Screen 3'))
            ],
          )),
        ));
  }
}
