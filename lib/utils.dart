import 'dart:math';

import 'package:Titties_RPG_App/main.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter_popup/flutter_popup.dart';

class Wrapper {
  // T? value;
  String name = "";
  double Xp = 0;
  // List<Wrapper> list=[];

  // getList(){
  //   return list;
  // }

  Wrapper(String this.name, double this.Xp);
}

class Weapons extends Wrapper {
  // @override
  // late List<Weapons> list;

  // static getList(){
  //   return super.list;
  // }

  Weapons(super.name, super.Xp) {
  }

 static List<Weapons> ee(){
    Weapons unarmed = new Weapons("unarmed", 0);
    Weapons dagger = new Weapons("dagger", 0);
    Weapons shield = new Weapons("shield", 0);
    Weapons staff = new Weapons("staff", 0);
    Weapons sword = new Weapons("sword", 0);
    Weapons haft = new Weapons("haft", 0);
    Weapons two_handed_sword = new Weapons("2-handed sword", 0);
    Weapons two_handed_haft = new Weapons("2-handed haft", 0);
    Weapons polearm = new Weapons("polearm", 0);
    Weapons sythe = new Weapons("sythe", 0);

    return [
      unarmed,
      dagger,
      shield,
      staff,
      sword,
      haft,
      two_handed_sword,
      two_handed_haft,
      polearm,
      sythe,
    ];
  }
}
