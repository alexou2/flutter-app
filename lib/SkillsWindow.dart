import 'package:Titties_RPG_App/spinboxWidget.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Skillsxpwindow extends StatelessWidget {
  // static List<Weapons> weaponList = Weapons.ee();
  Wrapper uwu = new Wrapper("uwuing", 0);
  Wrapper owo = new Wrapper("owoing", 0);


  @override
  Widget build(BuildContext context) {
    List<Wrapper> weaponList = [uwu, owo];

    return ChangeNotifierProvider(
      create: (context) => WrapperModel(),
      child: spinboxWidget(contents: weaponList),
    );
  }
}
