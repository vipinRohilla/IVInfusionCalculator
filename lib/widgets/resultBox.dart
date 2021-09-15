import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetResultBox extends StatefulWidget {
  String data;
  GetResultBox({required this.data});
  @override
  _GetResultBoxState createState() => _GetResultBoxState(data);
}

class _GetResultBoxState extends State<GetResultBox> {
  String data;

  _GetResultBoxState(this.data);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.green[600]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Result : ",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10.0),
              Text("$data",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          )),
    );
  }
}
