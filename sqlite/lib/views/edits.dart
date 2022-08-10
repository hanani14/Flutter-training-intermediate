import 'package:flutter/material.dart';
import 'package:sqlite/models/user.dart';
import 'package:sqlite/services/dbhandler.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key, required this.passUser})
      : super(
          key: key,
        );

  final User passUser;
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late DBHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DBHandler();
    print(widget.passUser.name);
  }

  @override
  Widget build(BuildContext context) {
    //declare controller
    final TextEditingController _nameController = TextEditingController()
      ..text = widget.passUser.name; //to put back data in textedititngcontroller
    final TextEditingController _ageController = TextEditingController()
      ..text = widget.passUser.age.toString();
    final TextEditingController _countryController = TextEditingController()
      ..text = widget.passUser.country.toString();
    final TextEditingController _emailController = TextEditingController()
      ..text = widget.passUser.email.toString();

    return Scaffold(
      appBar: AppBar(actions: []),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name:'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age:'),
            ),
            TextField(
              controller: _countryController,
              decoration: InputDecoration(labelText: 'Country:'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email:'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200, //to make size button bigger width
              child: ElevatedButton(
                  onPressed: () {
                    User user = User(
                        id: widget.passUser.id,
                        name: _nameController.text,
                        age: int.parse(_ageController.text),
                        email: _emailController.text,
                        country: _countryController.text);
                    handler.updateUser(user);
                    Navigator.pop(context);
                  },
                  child: Text('Update Data')),
            ),
          ],
        )),
      ),
    );
  }
}
