import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter_popup/flutter_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),

      // darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'TTRPG app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Wrapper<T> {
  T? value;

  Wrapper(T this.value);

  @override
  String toString() {
    return this.value.toString();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // used for the dropdown menu
  // the list of the elements in the dropdown menu
  List<String> _numbers_list = <String>['One', 'Two', 'Three', 'Six-Seven'];

  // the value of the selected input. it needs to be part of the option list
  var input = Wrapper("One");

  // used for spinbox
  double spinboxValue = 0;

  // for checkbox
  bool? checkboxValue = false;

  // weapon skill levels
  Wrapper<double> unarmedXPSpinboxValue = new Wrapper(0);
  Wrapper<double> daggerXPSpinboxValue = new Wrapper(0);
  Wrapper<double> shieldXPSpinboxValue = new Wrapper(0);
  Wrapper<double> staffXPSpinboxValue = new Wrapper(0);
  Wrapper<double> swordXPSpinboxValue = new Wrapper(0);
  Wrapper<double> haftXPSpinboxValue = new Wrapper(0);
  Wrapper<double> h2_swordXPSpinboxValue = new Wrapper(0);
  Wrapper<double> h2_haftXPSpinboxValue = new Wrapper(0);
  Wrapper<double> polearmXPSpinboxValue = new Wrapper(0);
  Wrapper<double> sytheXPSpinboxValue = new Wrapper(0);

  //

  void dropdown_clicked() {}

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // 1st argument: the variable that will contain the selected value, wrapped in class Wrapper
  // 2nd argument: the list of options to be displayed
  Widget createDropdownMenu<T>(Wrapper<T> value, List<T> options) {
    DropdownButton dropdown = DropdownButton<T>(
      value: value.value,
      onChanged: (T? newValue) {
        setState(() {
          value.value = newValue;
          print(input);
        });
      },

      items: options.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(value: value, child: Text(value.toString()));
      }).toList(),
    );
    return dropdown;
  }

  // creates a prompt asking for ammount of xp gained
  double promptForXPGained(BuildContext context) {
    print("added 10 xp");
_showOverlay(context);
    return 10;
  }

  List<Widget> makeXPSpinboxes(List<(String, Wrapper<double>)> contents, BuildContext context) {
    List<Widget> spinboxList = [];
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
                'LEVEL ${pow(2 * ee.$2.value!, (1 / 3)).floor()}  ${ee.$1} (${ee.$2.value!} XP)',
                // ' ${ee.$2.value!} ${ee.$1} XP (lvl ${pow(2 * ee.$2.value!, (1 / 3)).floor()})',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              TextButton(
                // style: ButtonStyle(overlayColor: WidgetStateProperty.fromMap(Colors.green)),
                onPressed: () => setState(() {
                  var xpGained = promptForXPGained(context);
                  ee.$2.value = ee.$2.value! + xpGained;
                }),
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

  void _showOverlay(BuildContext context) async {
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        // You can return any widget you like here
        // to be displayed on the Overlay
        return Positioned(
          left: MediaQuery.of(context).size.width * 0.2,
          top: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: [
                Image.asset(
                  'assets/transhaj.png',
                  colorBlendMode: BlendMode.multiply,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.13,
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          'Add XP!',
                          style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.028,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      GestureDetector(
                        onTap: () {
                          // When the icon is pressed the OverlayEntry
                          // is removed from Overlay
                          overlayEntry.remove();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.green,
                          size: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Inserting the OverlayEntry into the Overlay
    overlayState.insert(overlayEntry);
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: LayoutGrid(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          // mainAxisAlignment: .center,
          areas: '''
          header header  header
          weapons vision element
          .      .       magic
          .      .       .
        ''',
          columnSizes: [auto, auto, auto],
          rowSizes: [auto, auto, auto, auto],

          children: [
            NamedAreaGridPlacement(
              areaName: 'weapons',

              // child: Container(color: Colors.red),
              child: Column(
                // children: getWaponXPSpinboxes(),
                children: makeXPSpinboxes([
                  ("unarmed", unarmedXPSpinboxValue),
                  ("dagger", daggerXPSpinboxValue),
                  ("shield", shieldXPSpinboxValue),
                  ("staff", staffXPSpinboxValue),
                  ("sword", swordXPSpinboxValue),
                  ("haft", haftXPSpinboxValue),
                  ("2-handed sword", h2_swordXPSpinboxValue),
                  ("2-handed haft", h2_haftXPSpinboxValue),
                  ("polearm", polearmXPSpinboxValue),
                  ("sythe", sytheXPSpinboxValue),
                ], context),
                mainAxisAlignment: .center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: Example1());
//   }
// }


// children: [
//   createDropdownMenu(this.input, _numbers_list),
//   SpinBox(
//     min: 1,
//     max: 100,
//     value: spinboxValue,
//     onChanged: (value) => setState(() {spinboxValue = value;},
//     ), enabled: checkboxValue,),
//   const Text('You have pushed the button this many times:'),
//   Text(
//     '$_counter',
//     style: Theme.of(context).textTheme.headlineMedium,
//   ),
//   Text("dropdown: "+input.value!),
//   Text("spinbox: "+spinboxValue.toString()),
//   Checkbox(value: checkboxValue,tristate: true, onChanged: (bool? newValue)=> setState(() {
//     checkboxValue = newValue;
//     print(checkboxValue);
//   }))
// ],

//returns the list of spinboxes for weapon leveling
// List<Widget> getWaponXPSpinboxes() {
//   List<Widget> ret = [
//     // unarmed spinbox
//     Text(
//       'Unarmed Level:  ${pow(2 * unarmedXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: unarmedXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         unarmedXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // dagger spinbox
//     Text(
//       'Dagger Level:  ${pow(2 * daggerXPSpinboxValue.value!, (1 / 3)).round()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: daggerXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         daggerXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // shield spinbox
//     Text(
//       'Shield Level:  ${pow(2 * shieldXPSpinboxValue.value!, (1 / 3)).round()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: shieldXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         shieldXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // staff spinbox
//     Text(
//       'Staff Level:  ${pow(2 * staffXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: staffXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         staffXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // sword spinbox
//     Text(
//       'Sword Level:  ${pow(2 * swordXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: swordXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         swordXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // 2h sword spinbox
//     Text(
//       '2-Handed Sword Level:  ${pow(2 * h2_swordXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: h2_swordXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         h2_swordXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // haft spinbox
//     Text(
//       'Haft Level: ${pow(2 * haftXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: haftXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         haftXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // 2h haft spinbox
//     Text(
//       '2-Handed Haft Level: ${pow(2 * h2_haftXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: h2_haftXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         h2_haftXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // polearm spinbox
//     Text(
//       'Polearm Level: ${pow(2 * polearmXPSpinboxValue.value!, (1 / 3)).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: polearmXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         polearmXPSpinboxValue.value = value;
//       }),
//     ),
//
//     // sythe spinbox
//     Text(
//       'Sythe Level: ${pow(2 * sytheXPSpinboxValue.value!, 1 / 3).floor()}',
//     ),
//     SpinBox(
//       min: 0,
//       max: 500_000,
//       value: sytheXPSpinboxValue.value!,
//       onChanged: (value) => setState(() {
//         sytheXPSpinboxValue.value = value;
//         // playerExp-=0.5*pow(value+1,3);
//       }),
//
//       // enabled: playerExp>0.5*pow(sytheXPSpinboxValue,3)/
//     ),
//   ];
//   return ret;
// }
