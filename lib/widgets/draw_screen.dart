import 'package:flutter/cupertino.dart';
import 'package:macos_draw_app/provider/draw_provider.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawProvider>(
      builder: (context, value, child) {
        return Container(
          child: Stack(
            children: [
              SfSignaturePad(
                key: value.signaturePadKey,
                strokeColor: value.currentColor,
                minimumStrokeWidth: 0,
                maximumStrokeWidth: value.sliderValue,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.w * 0.4,
                  child: CupertinoSlider(
                    value: value.sliderValue,
                    min: 0,
                    max: 50,
                    onChanged: (newValue) {
                      value.setSliderValue(newValue);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
