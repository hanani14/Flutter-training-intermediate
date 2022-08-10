import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List? postArray;

  Future getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _jsonResponse = convert.jsonDecode(response.body);
      print(_jsonResponse);
      // setState(() {
        postArray = _jsonResponse;

      // });
        return postArray;
    } else {
      debugPrint('Connection Error ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Posts'),
          ),
          body: FutureBuilder(
            future: getPosts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: postArray == null ? 0 : postArray?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postArray?[index]['title']),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}

/*
 ListView.builder(shrinkWrap: true,itemCount:postArray== null? 0: postArray?.length ,itemBuilder: (context, index){
          return ListTile(title:Text(postArray?[index]['title']) ,
          );
        })
        
        
        */