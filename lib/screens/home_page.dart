import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macos_draw_app/provider/draw_provider.dart';
import 'package:macos_draw_app/widgets/draw_screen.dart';
import 'package:macos_draw_app/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrawProvider(),
      builder: (context, child) {
        var state = Provider.of<DrawProvider>(context);
        return Scaffold(
          body: Row(
            children: [
              DrawerMenu(),
              Expanded(child: DrawScreen()),
            ],
          ),
        );
      },
    );
  }
}


