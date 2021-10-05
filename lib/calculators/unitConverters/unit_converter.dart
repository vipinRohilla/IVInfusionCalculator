import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
const _padding = EdgeInsets.all(16.0);

class UnitConverter extends StatefulWidget {
  final Category category;

  UnitConverter({required this.category});

  @override
  _UnitConverterState createState() => _UnitConverterState(category: category);
}

class _UnitConverterState extends State<UnitConverter> {
  late Unit _fromValue;
  late Unit _toValue;
  double _inputValue = 0.0;
  String _convertedValue = "";
  final Category category;
  bool _showValidationError = false;
  late List<DropdownMenuItem> _unitMenuItems;
  final _inputKey = GlobalKey(debugLabel: 'inputText');
  bool _showErrorUI = false;

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  @override
  void didUpdateWidget(UnitConverter old) {
    super.didUpdateWidget(old);

    // We update our [DropdownMenuItem] units when we switch [Categories].
      _createDropdownMenuItems();
      _setDefaults();
      _updateConversion();
  }

  _UnitConverterState({required this.category});

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);

    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;

      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }

    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }

    return outputNum;
  }

  void _updateConversion() {
      setState(() {
        _convertedValue = _format(
            _inputValue * (_toValue.conversion / _fromValue.conversion));
      });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == '') {
        _convertedValue = '';
      } else {
          final inputDouble = double.parse(input);
          _inputValue = inputDouble;
          _showValidationError = false;
          _updateConversion();
      }
    });
  }

  void _setDefaults() {
    setState(() {
      _fromValue = widget.category.units[0];
      _toValue = widget.category.units[1];
    });
  }

  Unit _getUnit(String unitName) {
    return widget.category.units.firstWhere(
      (Unit unit) {
        return unit.name == unitName;
      },
      orElse: null,
    );
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });
    // to change the input according to current from conversion unit
    _updateConversion();
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });
    // to change the input according to current from conversion unit
    _updateConversion();
  }

  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.category.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  Widget _createDropDown(String currentValue, ValueChanged<dynamic> onChnaged) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          // color: Colors.blue[50],
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(5.0)
              
          ),
      child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.grey[50]),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                onChanged: onChnaged,
                value: currentValue,
                items: _unitMenuItems,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.category.name == "currency" && _showErrorUI)) {
      return SingleChildScrollView(
        child: Container(
          margin: _padding,
          padding: _padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: widget.category.color['error'],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 180.0,
                color: Colors.white,
              ),
              Text(
                "Oh no! We can't connect right now!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ),
      );
    }
    final inputBox = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            key: _inputKey,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.headline6,
              labelText: "Input",
              errorText: _showValidationError ? "Invalid Number Entered" : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)
                  )
                  
            ),
            keyboardType: TextInputType.number,
            onChanged: _updateInputValue,
          ),
          _createDropDown(_fromValue.name, _updateFromConversion)
        ],
      ),
    );

    final arrows = Text("To",textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),);
    final outputBox = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputDecorator(
            child: Text(
              _convertedValue,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: InputDecoration(
                labelText: "Output",
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
          _createDropDown(_toValue.name, _updateToConversion),
        ],
      ),
    );

    final converter = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[inputBox, arrows, outputBox],
    );
    return Scaffold(
      body: Padding(
        padding: _padding,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return SingleChildScrollView(
                child: converter,
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 450.0,
                    child: converter,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}