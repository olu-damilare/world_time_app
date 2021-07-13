import 'package:flutter/material.dart';
import 'package:world_time/pages/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime instance = WorldTime('Lagos', 'Africa/Lagos');
    await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'time': instance.time,
   });
  }



  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: SpinKitRotatingCircle(
            color: Colors.blue[700],
            size: 50.0,
          ),
      )
    );
  }
}
