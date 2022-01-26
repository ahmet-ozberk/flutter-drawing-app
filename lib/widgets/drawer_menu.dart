import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:macos_draw_app/provider/draw_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      alignment: Alignment.center,
      height: context.h,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey.shade900, width: 1),
        ),
      ),
      child: Consumer<DrawProvider>(
        builder: (context, value, child) {
          var math;
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 7),
                shrinkWrap: true,
                itemCount: value.colors.length,
                itemBuilder: (context, index) {
                  Color color = value.colors[index].color;
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => value.setColor(color),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: color == value.currentColor ? 5 : 10,
                      ),
                      height: color == value.currentColor ? 20 : 15,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(3),
                        border: value.currentColor == color
                            ? Border.all(color: Colors.white, width: 2)
                            : null,
                      ),
                    ),
                  );
                },
              ),
              const Divider(),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => value.signaturePadKey.currentState!.clear(),
                child: const Icon(
                  CupertinoIcons.clear_circled,
                  size: 35,
                  color: CupertinoColors.systemRed,
                ),
              ),
              const Divider(),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  ui.Image image = await value.signaturePadKey.currentState!
                      .toImage(pixelRatio: 2.0);
                  final byteData =
                      await image.toByteData(format: ui.ImageByteFormat.png);
                  final Uint8List imageBytes = byteData!.buffer.asUint8List(
                    byteData.offsetInBytes,
                    byteData.lengthInBytes,
                  );
                  final String path =
                      (await getApplicationSupportDirectory()).path;
                  final String fileName = "$path/output.png";
                  final File file = File(fileName);
                  await file.writeAsBytes(imageBytes);
                  OpenFile.open(fileName);
                },
                child: const Icon(
                  CupertinoIcons.folder_circle,
                  size: 35,
                  color: CupertinoColors.activeBlue,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
