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
          'local_address': 'local address',
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
          'host_address': 'host address',
        },
        'ru_RU': {
          //  indexPage
          'controllers': '????????????????????',
          'last_refresh': '?????????????????? ????????????????????',
          'count_controllers': '?????????????????????? ????????????????????????',
          'success_controller_connection': '??????????????????',
          'error_controller_connection': '????????????',
          'no_data': '?????? ????????????',
          'add': '????????????????',
          'controller_address': 'IP ?????????? ??????????????????????',
          'local_address': '?????????? ????????????????????????',
          'data_collections_status': '?????????????????? ?????????? ????????????',
          'pause': '???? ??????????',
          'works': '????????????????',
          'stopped': '??????????????????????',
          'resume_button': '??????????????????????',
          'pause_button': '??????????',
          'logout': '??????????',
          'users': '????????????????????????',
          //  loginPage and container add alert
          'login': '??????????',
          'password': '????????????',
          'tooltip_message': '?????????? ?? ???????????? ?????????? ???????????????? ?? Local Storage',
          'keep_me': '??????????????????',
          'log_in': '??????????',
          'login_enter': '????????????????????, ?????????????? ??????????',
          'password_enter': '????????????????????, ?????????????? ????????????',
          'error': '????????????',
          'error_login': '???????????????? ?????????? ?????? ????????????',
          // container add alert
          'enter_ip_address': '?????????????? IP ??????????',
          'enter_controller_login': '?????????????? ?????????? ??????????????????????',
          'enter_controller_password': '?????????????? ???????????? ??????????????????????',
          'error_enter_ip_address': '?????????????? IP ??????????',
          'error_enter_controller_login': '?????????????? ?????????? ??????????????????????',
          'error_enter_controller_password': '?????????????? ???????????? ??????????????????????',
          'controller_add': '????????????????',
          'success': '??????????',
          'success_add_controller': '???????????????????? ?????????????? ????????????????',
          'error_add_controller': '?????? ???????????????????? ?????????????????????? ?????????????????? ????????????',
          // container delete alert
          'delete_question': '?????????????? ?????????????',
          'confirm': '????',
          'cancel': '????????????',
          'success_deleting': '???????????????????? ?????????????? ??????????????',
          'deletion_error': '???????????????? ???????????? ?????? ???????????????? ??????????????????????',
          //  add user
          'is_super_user': '???????????? ?????????? ??????????????????????????',
          'super_user': '?????????? ????????????????????????',
          'user': '????????????????????????',
          'add_error':
              '?????? ???????????????????? ?????????????????????????? ?????????????????? ????????????. ?????????????????? ???????????????????????? ????????????',
          'add_success': '???????????????????????? ?????????????? ????????????????',
          // oneControllerPage
          'data_for_today': '???????????? ???? ??????????????',
          'chart_title': '???????????? ???????????? ??????????????????????',
          'start_date': '?????????????????? ????????',
          'end_date': '?????????????????? ????????',
          'vin': '?????????????? ????????????????????',
          'vout': '???????????????? ????????????????????',
          'temp': '??????????????????????',
          'charge': '??????????',
          'relay': '????????',
          'status': '????????????',
          // settings alert
          'host_address': '?????????? ??????????',
        }
      };
}
