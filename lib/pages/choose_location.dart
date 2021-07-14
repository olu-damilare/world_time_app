import 'package:flutter/material.dart';
import 'package:world_time/pages/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime( 'London', 'Europe/London'),
    WorldTime('Berlin', 'Europe/Berlin'),
    WorldTime('Lagos', 'Africa/Lagos'),
    WorldTime('Nairobi', 'Africa/Nairobi'),
    WorldTime('Chicago', 'America/Chicago'),
    WorldTime('New York', 'America/New_York'),
    WorldTime('Seoul', 'Asia/Seoul'),
    WorldTime('Jakarta', 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Choose a location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
              )
            ),
          );
        }
      )
    );
  }
}
