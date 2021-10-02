import 'package:flutter/material.dart';
import 'backdrop.dart';
import 'category.dart';
import 'category_tile.dart';
import 'unit.dart';
import 'dart:convert';
import 'dart:async';
import 'unit_converter.dart';

class CategoryRoute extends StatefulWidget {
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];
   Category? _defaultCategory;
   Category? _currentCategory;

  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFFA7C7E7),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFF89CFF0),
      'splash': Color(0xFF0096FF),
      'error': Color(0xFF912D2D),
    }),
  ];

  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    // We have static unit conversions located in our

    // assets/data/regular_units.json

    if (_categories.isEmpty) {
      await _retrieveLocalCategories();
    }
  }

  Future<void> _retrieveLocalCategories() async {
    final regularUnitsJson = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final unitsData = JsonDecoder().convert(await regularUnitsJson);
    if (unitsData is! Map) {
      throw ("Date retreived from API is not Map");
    }
    var categoryIndex = 0;
    unitsData.keys.forEach((key) {
      final List<Unit> units = unitsData[key]
          .map<Unit>((dynamic data) => Unit.fromJson(data))
          .toList();

      var category = Category(
          name: key,
          units: units,
          color: _baseColors[categoryIndex],
          iconLocation: _icons[categoryIndex]);
      setState(() {
        if (categoryIndex == 0) {
          _defaultCategory = category;
        }
        _categories.add(category);
      });
      categoryIndex++;
    });
  }

  
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  Widget _buildCategories(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var _category = _categories[index];
          return CategoryTile(
            category: _category,
            onTap: 
                _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories.map((Category category) {
          return CategoryTile(
            category: category,
            onTap: _onCategoryTap,
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    final listView = Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 48.0,
      ),
      child: _buildCategories(MediaQuery.of(context).orientation),
    );

    return Backdrop(
      currentCategory:
          _currentCategory == null ? _defaultCategory! : 
          _currentCategory!,
      frontPanel: 
      _currentCategory == null
          ? UnitConverter(category: _defaultCategory!)
          : 
          UnitConverter(category: _currentCategory!),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
  }
}
