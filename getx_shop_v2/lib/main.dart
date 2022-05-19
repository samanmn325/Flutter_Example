import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // await GetStorage.init();
  // final box = GetStorage();

  final prefs = await SharedPreferences.getInstance();
  var f = prefs.getString('f');
  var s = prefs.getString('s');

  runApp(
    GetMaterialApp(
      translations: Messages(),
      // locale: Locale('en', 'US'),
      // locale: box.read('f') != null
      //     ? Locale(box.read('f'), box.read('s'))
      //     : Locale('en', 'US'),
      locale: f != null ? Locale(f, s) : Locale('en', 'US'),
      // fallbackLocale: Locale('fa', 'IR'),
      home: Home(),
    ),
  );
}

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'text1': 'welcome',
          'text2': 'Clicks',
          'button label': 'فارسی'
        },
        'fa_IR': {
          'text1': 'خوش آمدید',
          'text2': 'کلیک ها',
          'button label': 'english'
        },
        'ar_AR': {
          'text1': 'اهلا و سهلا',
          'text2': 'تعليقات',
          'button label': 'dutch'
        },
        'du_GR': {
          'text1': 'fhshdhg ',
          'text2': 'shshgdg',
          'button label': 'عربی'
        }
      };
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  // final box = GetStorage();
  final prefs = SharedPreferences.getInstance();
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("text2".tr + " : ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('text1'.tr),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text("فارسی"),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        var locale1 = Locale('fa', 'IR');
                        await prefs.setString('f', 'fa');
                        await prefs.setString('s', 'IR');
                        // box.write('f', 'fa');
                        // box.write('s', 'IR');

                        Get.updateLocale(locale1);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text("english"),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        var locale1 = Locale('en', 'UD');
                        await prefs.setString('f', 'en');
                        await prefs.setString('s', 'US');
                        // box.write('f', 'en');
                        // box.write('s', 'US');
                        Get.updateLocale(locale1);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text("عربی"),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        var locale1 = Locale('ar', 'AR');
                        await prefs.setString('f', 'ar');
                        await prefs.setString('s', 'AR');
                        // box.write('f', 'ar');
                        // box.write('s', 'AR');
                        Get.updateLocale(locale1);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text("dutch"),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        var locale1 = Locale('du', 'GR');
                        await prefs.setString('f', 'du');
                        await prefs.setString('s', 'GR');
                        // box.write('f', 'du');
                        // box.write('s', 'GR');
                        Get.updateLocale(locale1);
                      }),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}
