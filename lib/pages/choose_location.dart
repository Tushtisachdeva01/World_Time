
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'india.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Pakistan', flag: 'pakistan.png', url: 'Asia/Karachi'),
    WorldTime(location: 'Egypt', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Kenya', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'Iraq', flag: 'iraq.jpg', url: 'Asia/Baghdad'),
    WorldTime(location: 'Thailand', flag: 'thailand.jpg', url: 'Asia/Bangkok'),
    WorldTime(location: 'Sri lanka', flag: 'srilanka.jpg', url: 'Asia/Colombo'),
    WorldTime(location: 'Bangladesh', flag: 'bangladesh.jpg', url: 'Asia/Dhaka'),
    WorldTime(location: 'Dubai', flag: 'uae.jpg', url: 'Asia/Dubai'),
    WorldTime(location: 'Hong kong', flag: 'hongkong.jpg', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Malaysia', flag: 'malaysia.jpg', url: 'Asia/Kuala_Lumpur'),
    WorldTime(location: 'South korea', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  ];

  void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context, {
      'location': instance.location,
      'time':instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal : 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}