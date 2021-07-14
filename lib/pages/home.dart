import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
   data = data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map;
   print(data);

   String bgImage = data['isDaytime'] ? 'daytime.jpg' : 'night.jpg';
   Color textColor =  Colors.white;
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                   RaisedButton.icon(
                       onPressed: () async {
                       dynamic result = await  Navigator.pushNamed(context, '/location');
                       setState(() {
                         if (result != null) {
                           data = {
                             'time': result['time'],
                             'location': result['location'],
                             'isDaytime': result['isDaytime'],
                           };
                         }
                       }
                       );
                       },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.white,
                      ),
                     label: Text(
                         "Modify location",
                     style: TextStyle(
                       color: Colors.white,
                     )),
                     color: Colors.black,
                       ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.0,
                          color: textColor,
                        )
                      ),
                    ]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 35.0,
                          letterSpacing: 2.0,
                        color: textColor,
                        fontWeight: FontWeight.w800,

                      )
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
