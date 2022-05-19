import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'en_title': 'exshop',
          'en_hello': 'Hello World',
          'en_clicks': 'clicks',
          'en_language': 'language',
          'en_settings': 'settings',
          'en_drawer_header': 'header',
          'en_dark_label': 'dark',
          'en_light_label': 'light',
        },
        'fa_IR': {
          'fa_title': 'ایکس شاپ',
          'fa_hello': 'سلام دنیا',
          'fa_clicks': 'تعداد کلیک ها',
          'fa_language': 'زبان',
          'fa_settings': 'تنظیمات',
          'fa_drawer_header': 'هدر',
          'fa_dark_label': 'تاریک',
          'fa_light_label': 'روشن',
        },
      };
}
