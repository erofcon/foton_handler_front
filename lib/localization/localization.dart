import 'package:get/get_navigation/src/root/internacionalization.dart';

class Localization extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'controllers': 'Controllers',
          'admin_panel': 'Admin panel',
          'last_refresh': 'Last refresh',
          'controllers_count': 'Controllers count',
          'charge_level': 'Charge level',
          'search_ip': 'Enter ip address',
        },
        'ru_RU': {
          'controllers': 'Котроллеры',
          'admin_panel': 'Admin panel',
          'last_refresh': 'Последнее обновление',
          'controllers_count': 'Общее колличество контроллеров',
          'charge_level': 'Уровень заряда',
          'search_ip': 'Введите ip адрес',
        }
      };
}
