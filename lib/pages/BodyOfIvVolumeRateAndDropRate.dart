import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/IvDropRate.dart';
import 'package:flutter_application_2/calculators/IvVolumeRate.dart';
import 'package:flutter_application_2/styling/size_config.dart';
class BodyOfIvVolumeAndDropRate extends StatefulWidget {
  @override
  _BodyOfIvVolumeAndDropRateState createState() =>
      _BodyOfIvVolumeAndDropRateState();
}

class _BodyOfIvVolumeAndDropRateState extends State<BodyOfIvVolumeAndDropRate> {
  List<Widget> containers = [IvVolumeRate(), IvDropRate()];
  int _currentIndex = 0;
  double myFontSize = 1.9 * SizeConfig.textMultiplier;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.blue[50],
          elevation: 1,
          title: Text(
            "IV Volume and Drop Rate",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: myFontSize),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              child:
                  Text("IV Volume Rate", style: TextStyle(color: Colors.black, fontSize: myFontSize)),
            ),
            Tab(
              child:
                  Text("IV Drop Rate", style: TextStyle(color: Colors.black, fontSize: myFontSize)),
            )
          ]),
        ),
        body: TabBarView(children: containers),
        // body: Body(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4.0,
          fixedColor: Colors.blue[50],
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Note',
              backgroundColor: Colors.blue[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.blue[900],
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
