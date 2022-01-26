import 'package:flutter/material.dart';
import 'package:macos_draw_app/model/color_model.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class DrawProvider extends ChangeNotifier {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  double sliderValue = 2.0;

  Color currentColor = Colors.white;
  final List<ColorModel> _colors = [
    ColorModel(Colors.red),
    ColorModel(Colors.yellow),
    ColorModel(Colors.grey),
    ColorModel(Colors.black),
    ColorModel(Colors.white),
    ColorModel(Colors.purple),
    ColorModel(Colors.pink),
    ColorModel(Colors.blue),
    ColorModel(Colors.lightBlueAccent),
    ColorModel(Colors.green),
    ColorModel(Colors.amber),
    ColorModel(Colors.deepOrange),
    ColorModel(Colors.orange),
    ColorModel(Colors.lime),
  ];
  List<ColorModel> get colors => _colors;
  void setColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  void setSliderValue(double value) {
    sliderValue = value;
    notifyListeners();
  }
}
