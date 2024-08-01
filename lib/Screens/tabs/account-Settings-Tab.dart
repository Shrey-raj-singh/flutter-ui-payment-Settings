import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_setting/provider/theme-Provider.dart';
import 'dart:html' as html;
import '../../provider/settings-Provider.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  bool is18Plus = false;
  Future<void> _pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files!.isNotEmpty) {
        final reader = html.FileReader();

        reader.readAsDataUrl(files[0]);
        reader.onLoadEnd.listen((e) {
          setState(() {
            Provider.of<SettingsProvider>(context, listen: false)
                .setProfileImage(NetworkImage(reader.result as String));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer2<SettingsProvider, ThemeProvider>(
        builder: (context, settingsProvider, themeProvider, child) {
          return Column(
            children: [
              // SwitchListTile(
              //   title: Text('is 18+'),
              //   value: provider.is18Plus,
              //   onChanged: (bool value) {
              //     provider.toggleIs18Plus(value);
              //   },
              // ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    settingsProvider.profileImage ?? AssetImage('default_avatar.png'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Add Image'),
              ),

              ListTile(
                title: const Text('Light Theme'),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: themeProvider.themeMode,
                  onChanged: (ThemeMode? value) {
                    themeProvider.setThemeMode(value!);
                  },
                ),
              ),
              ListTile(
                title: const Text('Dark Theme'),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: themeProvider.themeMode,
                  onChanged: (ThemeMode? value) {
                    themeProvider.setThemeMode(value!);
                  },
                ),
              ),
              DropdownButton<String>(
                value: settingsProvider.selectedLanguage,
                onChanged: (String? newValue) {
                  settingsProvider.setSelectedLanguage(newValue!);
                },
                items: <String>['English', 'Spanish', 'French', 'German']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          );
        },
      ),
    );
  }
}
