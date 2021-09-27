import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import 'package:flutter_application_2/styling/styling.dart';

getCard(
    String buttonText, Color colorData, BuildContext context, Widget myWidget) {
  return Container(
    child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.all<Color>(colorData),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 60))),
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => myWidget));
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [Icon(Icons.favorite_outline_outlined)],
              // ),
              // SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                      child: Text(buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue[50],
                            fontSize: 2.2 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w400,
                          ))),
                ],
              )
            ],
          ),
        )),
  );
}
