// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class DropDown extends StatefulWidget {
//   List<String> unit;
//   String currentItem;
//   DropDown({required this.unit, required this.currentItem});
//   @override
//   _DropDownState createState() => _DropDownState(unit, currentItem);
// }

// class _DropDownState extends State<DropDown> {
//   List<String> unit;
//   String currentItem;
//   _DropDownState(this.unit, this.currentItem);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           iconSize: 30.0,
//           iconEnabledColor: Colors.blue,
//           items: unit.map((String dropDownStringItem) {
//             return DropdownMenuItem<String>(
//               value: dropDownStringItem,
//               child: Text(dropDownStringItem),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               // print(this.currentItem);
//               this.currentItem = newValue.toString();
//               // print(this.currentItem);
//             });
//           },
//           value: currentItem,
//         ),
//       ),
//     );
//   }
// }
