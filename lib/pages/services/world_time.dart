import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
    String location;
    String time = "kolo";
    String url;


    WorldTime(this.location, this.url);

  Future<void> getTime() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime date = DateTime.parse(dateTime);
    print(date);
    date = date.add(Duration(hours: int.parse(offset)));
    time = date.toString();
  }
}

