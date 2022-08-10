import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sqlite/models/user.dart';
import 'package:sqlite/services/dbhandler.dart';
import 'package:sqlite/views/edits.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DBHandler handler;

  Future<int> createInitialUsers() async {
    User alfred = User(
        name: 'Alfred',
        age: 20,
        country: 'Malaysia',
        email: 'alfred@cloone.com.my');

    User azwan = User(
        name: 'azwan',
        age: 20,
        country: 'Malaysia',
        email: 'azwann@cloone.com.my');

    User fatin = User(
        name: 'fatin',
        age: 20,
        country: 'Malaysia',
        email: 'fatin@cloone.com.my');

    List<User> listofusers = [alfred, fatin, azwan];
    return await handler.insertUsers(listofusers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.handler = DBHandler();
    handler.initialiseDB().whenComplete(() async {
      setState(() {
        createInitialUsers();
      });
    });
  }

  Future<int> addUser(
      String _name, int _age, String _country, String _email) async {
    User newuser =
        User(name: _name, age: _age, country: _country, email: _email);

    return await handler.insertUser(newuser);
  }

  openWindowtoAddUser() {
    //declare controller
    final _nameController = TextEditingController();
    final _ageController = TextEditingController();
    final _countryController = TextEditingController();
    final _emailController = TextEditingController();

    AlertDialog openWindow = AlertDialog(
      title: Text('Add new user'),
      content: Container(
          child: Column(
        children: [
          TextField(
            controller: _nameController,
          ),
          TextField(
            controller: _ageController,
          ),
          TextField(
            controller: _countryController,
          ),
          TextField(
            controller: _emailController,
          ),
        ],
      )),
      actions: [
        TextButton(
            onPressed: () {
              addUser(_nameController.text, int.parse(_ageController.text),
                  _countryController.text, _emailController.text);
              Navigator.pop(context);
            },
            child: Text('ok')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'))
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return openWindow;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sql femo'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: FutureBuilder(
          future: this.handler.retrieveUsers(), //use this as data source
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot == null ? 0 : snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey<int>(snapshot.data![index].id!),
                      direction: DismissDirection.startToEnd,
                      background:
                          Container(color: Color.fromARGB(255, 218, 73, 0)),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deleteUser(snapshot.data![index].id!);
                        snapshot.data!.remove(snapshot.data![index]);
                        setState(() {});
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].email!),
                          onTap: () {
                            print('Edit this');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit(passUser:snapshot.data![index]))).whenComplete(() {
                                      setState(() {
                                        //refresh the screen after finish update
                                      });
                                    });
                          },
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
