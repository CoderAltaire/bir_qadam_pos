
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppValidator {
  const AppValidator._();
  static String? phone(String? value) {
    if (value == null) {
      return "Пожалуйста, заполните поле";
    }
    if (value.isEmpty) {
      return "Пожалуйста, заполните поле";
    }

    if (value.toString().length < 14) {
      return "Неправильный номер телефона";
    }
    return null;
  }

  static String? code(String? value) {
    if (value == null) {
      return "Пожалуйста, заполните поле";
    }
    if (value.isEmpty) {
      return "Пожалуйста, заполните поле";
    } else if (value.length < 4) {
      return "Неверный код";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value.toString().trim().isEmpty) {
      return 'Имя обязательно!';
    }
    return null;
  }

  static String? lastnameValidator(String? value) {
    if (value.toString().trim().isEmpty) {
      return 'Фамилия обязательно!';
    }
    return null;
  }

  // Phone number formatter
  static final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // Code number formatter
  static final codeFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  // static bool _validPattern(String value, String pattern) {
  //   return RegExp(pattern).hasMatch(value);
  // }

  // static const String _phonePattern = r'^\+998(9[01345789])[0-9]{7}$';
}
