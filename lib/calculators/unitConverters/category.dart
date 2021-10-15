import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/unitConverters/unit.dart';

class Category {
  final String iconLocation;
  final String name;
  final ColorSwatch color;
  final List<Unit> units;

  const Category({
   required this.iconLocation,
   required this.name,
   required this.color,
   required this.units,
  });
}