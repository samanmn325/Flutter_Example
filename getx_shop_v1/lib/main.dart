import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'my_controller.dart';
import 'my_dictionaty.dart';
import 'my_drawer.dart';
import 'unknown_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// todo: Step 1: Add 'Get' before your MaterialApp, turning it into GetMaterialApp
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('fa', 'IR'),
      fallbackLocale: Locale('fa', 'IR'),
      title: 'گت ایکس',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // localizationsDelegates: const [
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('fa', 'IR'), // OR Locale('ar', 'AE') OR Result RTL locales
      // ],
      // locale: const Locale(
      //     'fa', 'IR'), // OR Locale('ar', 'AE') OR Result RTL locales,
      unknownRoute: GetPage(
          name: UnknownRoutePage.routeName,
          page: () => const UnknownRoutePage()),
      // home: Home(),
      initialRoute: MyHomePage.routeName,
      getPages: [
        GetPage(name: MyHomePage.routeName, page: () => const MyHomePage()),
        GetPage(name: Result.routeName, page: () => Result()),
      ],
    );
  }
}

/// todo: Step 2: Create your business logic class and place all variables, methods and controllers inside it.

/// end Step 2
///
/// todo: Step 3: Create your View, use StatelessWidget and save some RAM,
/// with Get you may no longer need to use StatefulWidget.
class MyHomePage extends StatelessWidget {
  static String routeName = '/';

  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all 'child' routes there.
    final MyClass c = Get.put(MyClass());
    GlobalKey scaffoldKey = GlobalKey();
    return Scaffold(
        key: scaffoldKey,
        drawer: MyDrawer(),
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Obx(
            () => Text(
              ' ${c.getClickLabel()} : ${c.count}',
              style: const TextStyle(fontFamily: 'Iransans'),
            ),
          ),
        ),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${c.getTitleLabel()}'),
                ),
                ElevatedButton(
                    child: const Text(
                      'رفتن به بعدی!',
                      style: TextStyle(fontFamily: 'Iransans'),
                    ),
                    onPressed: () => Get.toNamed(Result.routeName)),
              ],
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            child: const Icon(FontAwesomeIcons.plus), onPressed: c.increment));
  }
}

class Result extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final MyClass c = Get.find();
  static String routeName = '/result';

  Result({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('${c.count}'),
      ElevatedButton(
          child: const Text(
            'رفتن به قبلی!',
            style: TextStyle(fontFamily: 'Iransans'),
          ),
          onPressed: () => Get.back()),
    ])));
  }
}

/// end Step 3

