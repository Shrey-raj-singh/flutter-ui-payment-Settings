import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool _is18Plus = false;
  bool _haveAccess = false;
  bool _lightOn = false;

  // ThemeMode _themeMode = ThemeMode.light;
  String _selectedLanguage = 'English';

  String get selectedLanguage => _selectedLanguage;

  // ThemeMode get themeMode => _themeMode;

  bool get is18Plus => _is18Plus;
  bool get haveAccess => _haveAccess;
  bool get lightOn => _lightOn;
  ImageProvider<Object>? _profileImage;

  ImageProvider<Object>? get profileImage => _profileImage;

  void toggleIs18Plus(bool value) {
    _is18Plus = value;
    notifyListeners();
  }

  void toggleHaveAccess(bool value) {
    _haveAccess = value;
    notifyListeners();
  }

  void toggleLightOn(bool value) {
    _lightOn = value;
    notifyListeners();
  }

  void setProfileImage(ImageProvider<Object> image) {
    _profileImage = image;
    notifyListeners();
  }

  // void setThemeMode(ThemeMode mode) {
  //   _themeMode = mode;
  //   notifyListeners();
  // }

  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
