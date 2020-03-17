import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location ,this.flag , this.url});

  Future <void> getTime() async {
      try {Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      String offmint = data['utc_offset'].substring(4,6);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offmint)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.yMMMd().add_jm().format(now);
      }
      catch(e) {
        print('caught error: $e');
        time ='could not get time data';
      }
  }
}

