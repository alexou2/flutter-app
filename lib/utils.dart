import 'dart:math';

import 'package:Titties_RPG_App/main.dart';
import 'package:Titties_RPG_App/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:flutter_popup/flutter_popup.dart';

class Wrapper<T> {
  T? value;

  Wrapper(T this.value);

  @override
  String toString() {
    return this.value.toString();
  }
}

