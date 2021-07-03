import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("Choose a location"),
        centerTitle: true,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child:  Text("counter is $counter"),
      )
    );
  }
}
