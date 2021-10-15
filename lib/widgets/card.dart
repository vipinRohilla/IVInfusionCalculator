import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';
// Color(0xFFA7C7E7)
Color myColor = Colors.blueAccent;
getCard(
    String buttonText, Color colorData, BuildContext context, Widget myWidget) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: myColor,
          blurRadius: 5.0,
          offset: Offset(0.0, 6.0)
        )
      ]
    ),
    child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all<Color>(myColor),
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
              Row(
                children: [
                  Expanded(
                      child: Text(buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 1.8 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w500,
                          ))),
                ],
              )
            ],
          ),
        )),
  );
}
