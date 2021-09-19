import 'package:flutter/material.dart';

getCard(
    String buttonText, Color colorData, BuildContext context, Widget myWidget) {
  return Container(
    child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all<Color>(colorData),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 40))),
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => myWidget));
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.favorite_outline_outlined)],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(buttonText,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              )
            ],
          ),
        )),
  );
}
