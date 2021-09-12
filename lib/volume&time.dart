import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VolumeAndTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 550,
        color: Colors.blue[50],
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            Text(
              "Calulate  the  total volume  of  fluid  in a given  time",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 19.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Infusion Rate",
                    labelText: "Infusion Rate",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                    border: OutlineInputBorder(),
                    suffixText: "ml",
                  ),
                  keyboardType: TextInputType.number,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Drop Factors",
                    labelText: "Drop Factors",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                    border: OutlineInputBorder(),
                    suffixText: "gtt/mL",
                  ),
                  keyboardType: TextInputType.number,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Total Time",
                    labelText: "Total Time",
                    labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                    border: OutlineInputBorder(),
                    suffixText: "minutes",
                  ),
                  keyboardType: TextInputType.number,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(double.infinity, 40))),
                    onPressed: () {},
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(double.infinity, 40)),
                    ),
                    onPressed: () {},
                    child: Text("Clear"))
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[600]),
                  child: Text("Result : ",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            )
          ],
        ),
      ),
    ]);
  }
}
