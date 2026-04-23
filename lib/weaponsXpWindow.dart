import 'package:Titties_RPG_App/spinboxWidget.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:flutter/cupertino.dart';

class WeaponsState extends StatefulWidget {
  const WeaponsState({Key? key}) : super(key: key);

  @override
  Weaponsxpwindow createState() => Weaponsxpwindow();
}

class Weaponsxpwindow extends State<WeaponsState> {
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

  void updateInfo() {
    setState(() {
      unarmedXPSpinboxValue.value = 10;
    });
  }

  @override
  Widget build(BuildContext context) {

    return spinboxWidget(
          contents: [
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
          ],
          context: context,
          instance: this,
        ).build(context)
        as Widget;
  }
}
