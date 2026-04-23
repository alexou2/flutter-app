import 'dart:math';

import 'package:Titties_RPG_App/main.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:Titties_RPG_App/weaponsXpWindow.dart';
import 'package:Titties_RPG_App/xpOverlayWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter_popup/flutter_popup.dart';


class spinboxWidget<T> extends State<MyHomePage> {
  // var contents;

  List<(String, Wrapper<double>)> contents;
  BuildContext context;
  T instance;



  spinboxWidget({required this.contents, required this.context, required T this.instance});

  List<Widget> makeXPSpinboxes(// List<(String, Wrapper<double>)> contents,
      BuildContext context,) {
    List<Widget> spinboxList = [];
    print(this.contents[0].$2);
    for ((String title, Wrapper<double> variable) ee in contents) {
      var spin = Row(
        children: [
          Column(
            children: [
              Image.asset("assets/transhaj.png", width: 50, height: 50),
            ],
          ),

          Column(
            children: [
              Text(
                'LEVEL ${pow(2 * ee.$2.value!, (1 / 3)).floor()}  ${ee.$1} (${ee
                    .$2.value!} XP)',
                // ' ${ee.$2.value!} ${ee.$1} XP (lvl ${pow(2 * ee.$2.value!, (1 / 3)).floor()})',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              TextButton(
                // style: ButtonStyle(overlayColor: WidgetStateProperty.fromMap(Colors.green)),
                // onPressed: () => setState(() {
                //   // var xpGained = promptForXPGained(context);
                //   // xpOverlay()._showOverlay(context, ee.$2, ee.$1); //todo fix the class creation method
                //   // ee.$2.value = ee.$2.value! + xpGained;
                // }),
                onPressed: () =>xpOverlay(title:  ee.$1,xp: ee.$2, context: context, instance: instance as Weaponsxpwindow).build(context),
                child: Text("Add XP"),
              ),
            ],
          ),
        ],
      );
      spinboxList.add(spin);
    }
    return spinboxList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeXPSpinboxes(context),
    );
  }
}

