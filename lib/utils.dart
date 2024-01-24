import 'package:flutter/material.dart';
import 'dart:collection';

class TextData {
  int id;
  String textValue;
  double topValue;
  double leftValue;

  String textFont;
  Color textColor;

  TextData(this.id, this.textValue,
      [this.leftValue = 10.0,
      this.topValue = 10.0,
      this.textFont = "Roboto",
      this.textColor = Colors.black]);
}

class TextDataList extends ChangeNotifier {
  final List<TextData> _textDataList = [TextData(0, "Default Text")];
  int selectedIndex = 0;

  UnmodifiableListView<TextData> get textDataList =>
      UnmodifiableListView(_textDataList);

  void addNewText() {
    _textDataList.add(TextData(_textDataList.length, "Click to change"));
    notifyListeners();
  }

  void changeSelected(int newSelected) {
    selectedIndex = newSelected;
    notifyListeners();
  }

  // text editing controllers
  void changeTextValue(int index, String newTextValue) {
    _textDataList[index].textValue = newTextValue;
    notifyListeners();
  }

  void changeTextFont(int index, String newFont) {
    _textDataList[index].textFont = newFont;
    notifyListeners();
  }

  void changeTextColor(int index, Color newColor) {
    _textDataList[index].textColor = newColor;
    notifyListeners();
  }

  void changePosition(int index, double x, double y) {
    _textDataList[index].leftValue += x;
    // bound x
    if (_textDataList[index].leftValue < 10) {
      _textDataList[index].leftValue = 10;
    } else if (_textDataList[index].leftValue > 350) {
      _textDataList[index].leftValue = 350;
    }

    // bound y
    if (_textDataList[index].topValue < 10) {
      _textDataList[index].topValue = 10;
    } else if (_textDataList[index].topValue > 630) {
      _textDataList[index].topValue = 630;
    }

    _textDataList[index].topValue += y;
    notifyListeners();
  }
}
