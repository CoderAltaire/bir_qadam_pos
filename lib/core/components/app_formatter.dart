import 'package:device_info_plus/device_info_plus.dart';
import 'package:bir_qadam_pos/core/components/components.dart';

import 'dart:math' as math;

import '../../hive_helper/hive_prefs.dart';

class AppFormatter {
  const AppFormatter._();
  static String formatDate(DateTime date) {
    int year = date.year;
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String formatted = '$day.$month.$year';

    return formatted;
  }

  static DateTime parseDate(String date) {
    if (date.isEmpty) return DateTime(2000);
    List<int> dates = date.split('.').map((e) => int.parse(e)).toList();
    return DateTime(dates[2], dates[1], dates[0]);
  }

  static String formatDateFromMills(num? mills, {String pattern = ''}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(mills?.toInt() ?? 0);
    int year = date.year;
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String hh = date.hour.toString().padLeft(2, '0');
    String mm = date.minute.toString().padLeft(2, '0');

    String formatted = '$day/$month/$year';

    if (pattern == '##.##') {
      formatted = '$day.$month.$year $hh:$mm';
    } else if (pattern == 'dd MM') {
      DateFormat format = DateFormat('dd MMMM', AppPrefs.language);
      formatted = format.format(date);
    }

    return formatted;
  }

  static String formatTimeFromMills(num? mills, {bool hasSecond = false}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(mills?.toInt() ?? 0);
    String hour = date.hour.toString().padLeft(2, '0');
    String minute = date.minute.toString().padLeft(2, '0');
    String second = date.second.toString().padLeft(2, '0');

    String formatted = '$hour:$minute';
    String withSecond = '$hour:$minute:$second';
    return hasSecond ? withSecond : formatted;
  }

  static String formatPhone(String phone) {
    String prefix = phone.substring(0, 4);
    String areaCode = phone.substring(4, 6);
    String major = phone.substring(6, 9);
    String minor = phone.substring(9, 11);
    String patch = phone.substring(11);
    String formatted = '$prefix ($areaCode) $major-$minor-$patch';
    return formatted;
  }

  static String formatCardNumber(String number) {
    String formatted = '';
    for (int i = 0; i < number.length; i++) {
      if (i != 0 && i % 4 == 0) {
        formatted += ' ${number[i]}';
      } else {
        formatted += number[i];
      }
    }
    return formatted;
  }

  static String orderTime(DateTime date) {
    int year = date.year;
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String minut = date.minute.toString().padLeft(2, '0');
    String hour = date.hour.toString().padLeft(2, '0');
    String formatted = '$day.$month.$year $hour:$minut';

    return formatted;
  }

  static String orderTimeWithMonth(DateTime date) {
    int year = date.year;
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String minut = date.minute.toString().padLeft(2, '0');
    String hour = date.hour.toString().padLeft(2, '0');
    String formatted = '$day.$month.$year $hour:$minut';
    DateFormat format = DateFormat('dd MMMM HH:mm ', AppPrefs.language);
    formatted = format.format(date);
    return formatted;
  }

  static String orderStringTimeWithMonth(String example) {
    String formatted = example.substring(0,16).replaceAll(RegExp(r'T'), ' ').replaceAll(RegExp(r'-'), '.');
    return formatted;
  }

  static String cardNubderFormat(String number) {
    String cardNum = number.replaceRange(6, 12, '*****');

    return cardNum;
  }

  static String formatPrice(num? price, {String? locale}) {
    NumberFormat format = NumberFormat.currency(
      locale: locale ?? 'uz',
      name: '',
      decimalDigits: locale == 'en' ? 2 : 0,
      customPattern: '###,###.##',
    );
    String formatted = format.format(price ?? 0);
    return formatted;
  }

  static String getMonth(DateTime dateTime) {
    List<String> months = [
      'Yanvar',
      'Fevral',
      'Mart',
      'Aprel',
      'May',
      'Iyun',
      'Iyul',
      'Avgust',
      'Sentyabr',
      'Oktyabr',
      'Noyabr',
      'Dekabr'
    ];
    // DateTime dateTime = DateTime.parse(date);
    int m = dateTime.month;

    return months[m - 1];
  }

  static String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static Future<Map> getDeviceInfo() async {
    Map<String, dynamic> deviceInfo = {};
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final builder = await deviceInfoPlugin.androidInfo;
      deviceInfo['name'] = builder.manufacturer;
      deviceInfo['model'] = builder.model;
    } else {
      final data = await deviceInfoPlugin.iosInfo;
      deviceInfo['model'] = data.model;
      deviceInfo['name'] = data.name;
    }

    return deviceInfo;
  }
}

class OrderDeiliveryState {
  static const String newOrder = 'new-order';
  static const String active = 'active';
  static const String inProgress = 'in-progress';
  static const String completed = 'completed';
  static const String cancelled = 'cancelled';
}
