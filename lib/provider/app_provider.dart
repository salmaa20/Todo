import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{

  ThemeMode currentTheme = ThemeMode.light;
  bool isDark(){
    return currentTheme == ThemeMode.dark ;

  }
  void changeTheme(ThemeMode newTheme){
    if (newTheme == currentTheme)return;
    currentTheme == newTheme;
    notifyListeners();
  }
}