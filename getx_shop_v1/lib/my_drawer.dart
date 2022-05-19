import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop/my_controller.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  MyClass c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.red),
          child: Center(child: Text('${c.getDrawerHeaderLabel()}')),
          padding: const EdgeInsets.all(30),
        ),
        ExpansionTile(
          title: Text('${c.getSettingsLabel()}'),
          children: [
            Row(
              children: [
                Text(' ${c.getLanguageLabel()} : '),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: Text('فارسی'),
                    onPressed: () {
                      var locale = Locale('fa', 'IR');
                      Get.updateLocale(locale);
                      c.setLanguage('fa');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: Text('english'),
                    onPressed: () {
                      var locale1 = Get.deviceLocale;
                      Get.updateLocale(locale1!);
                      c.setLanguage('en');
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(' ${c.getLanguageLabel()} : '),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: Text('${c.getDarkLabel()}'),
                    onPressed: () {
                      print(Get.isDarkMode);
                      Get.changeTheme(ThemeData.dark());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: Text('${c.getLightLabel()}'),
                    onPressed: () {
                      print(Get.isDarkMode);
                      Get.changeTheme(ThemeData.light());
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
