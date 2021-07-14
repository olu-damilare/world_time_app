import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
    String location;
    String time = "kolo";
    String url;
    bool isDaytime = false;

    WorldTime(this.location, this.url);

  Future<void> getTime() async{

    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime date = DateTime.parse(dateTime);
      date = date.add(Duration(hours: int.parse(offset)));
      isDaytime = date.hour > 6 && date.hour < 19 ? true : false;
      time = DateFormat.jm().format(date);
    }catch(e){
      print('caught error: $e');
      time = "could not fetch time data";
    }
  }
}

