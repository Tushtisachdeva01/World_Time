

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue[600] : Colors.lightBlue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                
                SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         data['location'].toUpperCase(),
                         style: TextStyle (
                           fontWeight: FontWeight.bold,
                           fontSize: 35.0,
                           letterSpacing: 2.0,
                         )
                       ),
                      // Image(
                      // image:AssetImage(data['locations.flag']),
                      // ),
                     ]
                  ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                  ),
                ),
                SizedBox(height: 100.0),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag'],
                        'index': result['index'],
                      };
                    });
                  }, 
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[800],
                  size: 30.0,
                  ), 
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                  ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}