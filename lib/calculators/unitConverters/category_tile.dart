import 'package:flutter/material.dart';
import 'category.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({Key? key,required this.category,required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Material(
        color: 
            Colors.transparent,
        child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: category.color['highlight'],
            splashColor: category.color['splash'],
            onTap: 
            () => onTap(category),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset(category.iconLocation)),
                  Center(
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
