import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 360,
            child: Column(
              children: [
                Row(children: [
                  Column(
                    children:[
                    Container(
                         height: 362,
                            width: 360,
                      child: 
                    Stack(
                      children:[ Container( 
                        width: 360,
                        height: 330,
                        color: Color.fromARGB(255, 64, 116 , 86),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                                  width: 66,
                                  height: 66,
                                  color: Colors.black,
                                ),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Text('xxx'),
                                    Text('xxx'),
                                     Text('xxx'),
                                 ],
                               ),
                            ],
                            ),),
                            Align(alignment: Alignment.bottomCenter,
                             child: Container(width: 203,height: 70,color: Colors.yellow,)
                            )
                       ]
                    ),
                  
                    ),
               
                  ] ,)
                ],),
                SizedBox(height: 24,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                   borderRadius:BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () => null,
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.amber,
                          child: Image.asset('image/rose.jpeg'),
                        ),
                      ),
                    ),
                     Container(
                      width: 80,
                      height: 80,
                      color: Colors.amber,
                        child: Image.asset('image/jisoo.jpeg'),
                    ),
                     Container(
                      width: 80,
                      height: 80,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(height: 24,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 257,
                      color: Colors.cyan,
                    ),
                    Container(
                      width: 150,
                      height: 257,
                      color: Colors.cyan,
                    )
                  ],
                ),
                OutlineButton(onPressed: (){
                  print('Text2');
                  
                }, child: Text('Click me')),
               PopupMenuButton(
              onSelected: (String value) {
                    // do something with the selected value here
              },
              itemBuilder: (BuildContext ctx) => [
                    const PopupMenuItem(value: '1', child: Text('Option 1')),
                    const PopupMenuItem(value: '2', child: Text('Option 2')),
                    const PopupMenuItem(value: '3', child: Text('Option 3')),
                    const PopupMenuItem(value: '4', child: Text('Option 4')),
])
              ],
            ),
          ),
        ));
  }
}
