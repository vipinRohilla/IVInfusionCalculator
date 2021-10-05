import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import 'category.dart';

final _rowHeight = 100.0;

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({Key? key,required this.category,required this.onTap});


  @override
  Widget build(BuildContext context) {
    double myFontSize = 1.7 * SizeConfig.textMultiplier;
    return Material(
        color: 
            Colors.transparent,
        child: Container(
          height: _rowHeight,
          child: ElevatedButton(
            onPressed: 
            () => onTap(category),
            child:  
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset(category.iconLocation, width: 10* SizeConfig.imageSizeMultiplier, height: 10 *SizeConfig.imageSizeMultiplier,)),

                  // Expanded(
                      // flex: 1,
                      // child: 
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: myFontSize),
                      ),
                  // )
                ],
              ),
          ),
        ));
  }
}