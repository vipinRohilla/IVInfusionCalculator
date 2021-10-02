import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/unitConverters/category_route.dart';


class BodyOfUnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Unit Converter",
        theme: ThemeData(
            fontFamily: 'Raleway',
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.black, displayColor: Colors.grey[500]),
            primaryColor: Colors.grey[500], textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.green[500])),
        home: CategoryRoute(),
      ),
    );
  }
}
