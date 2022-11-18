import 'package:get/get_navigation/src/root/internacionalization.dart';

class Localization extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //  indexPage
          'controllers': 'Controllers',
          'last_refresh': 'last refresh',
          'count_controllers': 'count controllers',
          'success_controller_connection': 'connected',
          'error_controller_connection': 'error',
          'no_data': 'no data',
          'add': 'add',
          'controller_address': 'controller ip address',
          'data_collections_status': 'data collections status',
          'pause': 'pause',
          'works': 'works',
          'stopped': 'stopped',
          'resume_button': 'resume',
          'pause_button': 'pause',
          'logout': 'logout',
          'users': 'users',
          // loginPage and container add alert
          'login': 'Login',
          'password': 'Password',
          'tooltip_message':
              'login and password will be saved in Local Storage',
          'keep_me': 'keep me',
          'log_in': 'log in',
          'login_enter': 'please enter login',
          'password_enter': 'please enter password',
          'error': 'error',
          'error_login': 'wrong login or password',
          // container add alert
          'enter_ip_address': 'enter ip address',
          'enter_controller_login': 'enter controller login',
          'enter_controller_password': 'enter controller password',
          'error_enter_ip_address': 'enter ip address',
          'error_enter_controller_login': 'enter controller login',
          'error_enter_controller_password': 'enter controller password',
          'controller_add': 'add',
          'success': 'success',
          'success_add_controller': 'controller added successfully',
          'error_add_controller':
              'An error occurred while adding the controller',
          // container delete alert
          'delete_question': 'delete entry?',
          'confirm': 'confirm',
          'cancel': 'cancel',
          'success_deleting': 'controller deleted successfully',
          'deletion_error': 'error when deleting controller',
          //  add user
          'is_super_user': 'is super user',
          'super_user': 'super user',
          'user': 'user',
          'add_error':
              'An error occurred while adding the user. Check the uniqueness of the login',
          'add_success': 'User added successfully',
          // oneControllerPage
          'data_for_today': 'data for today',
          'chart_title': 'Controller work schedule',
          'start_date': 'start date',
          'end_date': 'end date',
          'vin': 'input voltage',
          'vout': 'output voltage',
          'temp': 'temperature',
          'charge': 'charge',
          'relay': 'relay',
          'status': 'status',
          // settings alert
          'host_address':'host address',
        },
        'ru_RU': {
          //  indexPage
          'controllers': 'Котроллеры',
          'last_refresh': 'последнне обновление',
          'count_controllers': 'колличество контроллеров',
          'success_controller_connection': 'соединено',
          'error_controller_connection': 'ошибка',
          'no_data': 'нет данных',
          'add': 'добавить',
          'controller_address': 'Ip адрес контроллера',
          'data_collections_status': 'состояние сбора данных',
          'pause': 'на паузе',
          'works': 'работает',
          'stopped': 'остановлено',
          'resume_button': 'возобновить',
          'pause_button': 'пауза',
          'logout': 'выйти',
          'users': 'пользователи',
          //  loginPage and container add alert
          'login': 'Логин',
          'password': 'Пароль',
          'tooltip_message': 'логин и пароль будет сохранен в Local Storage',
          'keep_me': 'запомнить',
          'log_in': 'войти',
          'login_enter': 'пожалуйста, введите логин',
          'password_enter': 'пожалуйста, введите пароль',
          'error': 'ошибка',
          'error_login': 'неверный логин или пароль',
          // container add alert
          'enter_ip_address': 'введите IP адрес',
          'enter_controller_login': 'введите логин контроллера',
          'enter_controller_password': 'введите пароль контроллера',
          'error_enter_ip_address': 'введите IP адрес',
          'error_enter_controller_login': 'введите логин контроллера',
          'error_enter_controller_password': 'введите пароль контроллера',
          'controller_add': 'добавить',
          'success': 'успех',
          'success_add_controller': 'контроллер успешно добавлен',
          'error_add_controller': 'при добавлении контроллера произошла ошибка',
          // container delete alert
          'delete_question': 'удалить запись?',
          'confirm': 'да',
          'cancel': 'отмена',
          'success_deleting': 'контроллер удалено успешно',
          'deletion_error': 'возникла ошибка при удалении контроллера',
          //  add user
          'is_super_user': 'статус супер пользователья',
          'super_user': 'супер пользователь',
          'user': 'пользователь',
          'add_error':
              'При добавлении пользователья произошла ошибка. Проверьте уникальность логина',
          'add_success': 'Пользователь успешно добавлен',
          // oneControllerPage
          'data_for_today': 'данные за сегодня',
          'chart_title': 'График работы контроллера',
          'start_date': 'начальная дата',
          'end_date': 'финальная дата',
          'vin': 'входное напряжение',
          'vout': 'выходное напряжение',
          'temp': 'температура',
          'charge': 'заряд',
          'relay': 'реле',
          'status': 'статус',
          // settings alert
          'host_address':'адрес хоста',
        }
      };
}
