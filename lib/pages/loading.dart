import 'package:flutter/material.dart';
import 'package:world_time/pages/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime instance = WorldTime('Berlin', 'Europe/Berlin');
    await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'time': instance.time,
     'isDaytime': instance.isDaytime,
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
         child: Text('Loading...'),
      ),
    );
  }
}
