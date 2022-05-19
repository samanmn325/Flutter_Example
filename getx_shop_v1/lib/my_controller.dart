import 'package:get/get.dart';

class MyClass extends GetxController {
  var count = 0.obs;
  increment() => count++;
///////////////////////////////////////////////////////////////////////////////
  var helloLabel = 'ایکس شاپ'.obs;
  var titleLabel = 'سلام دنیا'.obs;
  var clickLabel = 'تعداد کلیک ها'.obs;
  var languageLabel = 'زبان'.obs;
  var settingsLabel = 'تنظیمات'.obs;
  var drawerHeaderLabel = 'هدر'.obs;
  var darkLabel = 'تاریک'.tr.obs;
  var lightLabel = 'روشن'.tr.obs;

  getTitleLabel() => titleLabel;
  getClickLabel() => clickLabel;
  getHelloLabel() => helloLabel;
  getLanguageLabel() => languageLabel;
  getSettingsLabel() => settingsLabel;
  getDrawerHeaderLabel() => drawerHeaderLabel;
  getDarkLabel() => darkLabel;
  getLightLabel() => lightLabel;

  setLanguage(var chosenLanguage) {
    if (chosenLanguage == 'en') {
      helloLabel = 'en_hello'.tr.obs;
      titleLabel = 'en_title'.tr.obs;
      clickLabel = 'en_clicks'.tr.obs;
      languageLabel = 'en_language'.tr.obs;
      settingsLabel = 'en_settings'.tr.obs;
      drawerHeaderLabel = 'en_drawer_header'.tr.obs;
      darkLabel = 'en_dark_label'.tr.obs;
      lightLabel = 'en_light_label'.tr.obs;
    } else {
      titleLabel = 'fa_hello'.tr.obs;
      helloLabel = 'fa_hello'.tr.obs;
      titleLabel = 'fa_title'.tr.obs;
      clickLabel = 'fa_clicks'.tr.obs;
      languageLabel = 'fa_language'.tr.obs;
      settingsLabel = 'fa_settings'.tr.obs;
      drawerHeaderLabel = 'fa_drawer_header'.tr.obs;
      darkLabel = 'fa_dark_label'.tr.obs;
      lightLabel = 'fa_light_label'.tr.obs;
    }
  }

  ///////////////////////////////////////////////////////////
  var themeLabel;
  getThemeLabel() =>
      lightLabel = Get.isDarkMode ? getLightLabel() : getDarkLabel();
}
