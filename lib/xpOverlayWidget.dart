import 'dart:math';

import 'package:Titties_RPG_App/main.dart';
import 'package:Titties_RPG_App/spinboxWidget.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:Titties_RPG_App/weaponsXpWindow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter_popup/flutter_popup.dart';

// class overlayState extends StatefulWidget {
//   const overlayState({Key? key}) : super(key: key);
//
// // const String title;
// // const Wrapper<double> xp;
//
//   @override
//   xpOverlay createState() => overlayState();
// }

class xpOverlay<T> extends State<WeaponsState> {
  Wrapper<double> xp;
  String title;
  BuildContext context;
  Weaponsxpwindow instance;

  // BuildContext context;

  xpOverlay({
    required this.title,
    required this.xp,
    required BuildContext this.context,
    required Weaponsxpwindow this.instance,
  });

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
  // @override
  // // ignore: must_call_super
  // initState() {
  //   // ignore: avoid_print
  //   print("initState Called");
  // }

  // void _showOverlay(
  //     BuildContext context,
  //     Wrapper<double> xp,
  //     String title,
  //     ) async {
  @override
  Widget build(BuildContext context) {
    print("object");
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    final controller = TextEditingController();
    double xpToAdd = 0;

    overlayEntry = OverlayEntry(
      builder: (context) {
        // You can return any widget you like here
        // to be displayed on the Overlay
        return Positioned(
          left: MediaQuery.of(context).size.width * 0.2,
          top: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.5,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: Theme.of(context).colorScheme.inversePrimary,

              child: LayoutGrid(
                areas: '''
          .      title .
          icon   xpNum apply
          .      .     exit
        ''',
                columnSizes: [auto, auto, auto],
                rowSizes: [auto, auto, auto],
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NamedAreaGridPlacement(
                    areaName: 'icon',
                    child: Image.asset(
                      'assets/transhaj.png',
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                  // add xp text
                  NamedAreaGridPlacement(
                    areaName: 'title',
                    child: Material(
                      color: Colors.transparent,

                      child: Text(
                        'Add $title XP!',

                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.028,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(width: MediaQuery.of(context).size.width * 0.2),

                  // exit button
                  NamedAreaGridPlacement(
                    areaName: 'exit',
                    child: TextButton(
                      // style: ButtonStyle(overlayColor: WidgetStateProperty.fromMap(Colors.green)),
                      onPressed: () {
                        overlayEntry.remove();
                        controller.dispose();
                      },
                      child: Text("Cancel"),
                    ),
                    // child: GestureDetector(
                    //
                    //   onTap: () {
                    //
                    //     // When the icon is pressed the OverlayEntry
                    //     // is removed from Overlay
                    //     overlayEntry.remove();
                    //     controller.dispose();
                    //   },
                    //
                    //   child: Icon(
                    //     Icons.close,
                    //     color: Colors.green,
                    //     size: MediaQuery.of(context).size.height * 0.025,
                    //   ),
                    // ),
                  ),
                  NamedAreaGridPlacement(
                    areaName: "xpNum",
                    child: Material(
                      color: Colors.transparent,

                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(labelText: "Xp to add"),
                        keyboardType: TextInputType.number,
                        //todo add form verification for numbers
                      ),
                    ),
                  ),
                  NamedAreaGridPlacement(
                    areaName: "apply",
                    child: TextButton(
                      // style: ButtonStyle(overlayColor: WidgetStateProperty.fromMap(Colors.green)),
                      onPressed: () {
                        String xpStr = controller.text;
                        if (xpStr != "") {
                          xpToAdd = double.parse(xpStr);
                          xp.value = xp.value! + xpToAdd;
                          print(xpToAdd);
                          instance.updateInfo();
                          overlayEntry.remove();
                          controller.dispose();
                        }
                      },
                      child: Text("Add XP"),
                    ),
                  ),
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height * 0.15,
                  //   left: MediaQuery.of(context).size.width * 0.13,
                  //   child: Row(
                  //     children: [
                  //       Material(
                  //         color: Colors.transparent,
                  //         child: Text(
                  //           'Add XP!',
                  //           style: TextStyle(
                  //             fontSize:
                  //             MediaQuery.of(context).size.height * 0.028,
                  //             color: Colors.green,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  //       GestureDetector(
                  //         onTap: () {
                  //           // When the icon is pressed the OverlayEntry
                  //           // is removed from Overlay
                  //           overlayEntry.remove();
                  //         },
                  //         child: Icon(
                  //           Icons.close,
                  //           color: Colors.green,
                  //           size: MediaQuery.of(context).size.height * 0.025,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Inserting the OverlayEntry into the Overlay
    overlayState.insert(overlayEntry);
    return Column();
  }
}
