import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ThemeAppState {
  const ThemeAppState();
}

class ThemeAppInitialState extends ThemeAppState {}

class AppChangeModeState extends ThemeAppState {}
