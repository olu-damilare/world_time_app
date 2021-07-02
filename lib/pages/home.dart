import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
               RaisedButton.icon(
                   onPressed: (){
                     Navigator.pushNamed(context, '/location');
                   },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.white,
                  ),
                 label: Text("Modify location"),
                 color: Colors.blueAccent,
                   )
            ],
          )),
    );
  }
}