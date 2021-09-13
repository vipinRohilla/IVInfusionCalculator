import 'package:flutter/material.dart';

getCard(
    String buttonText, Color colorData, BuildContext context, Widget myWidget) {
  return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all<Color>(colorData),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 40))),
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => myWidget));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.favorite_outline_rounded)],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(buttonText,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )
          ],
        ),
      ));
}
