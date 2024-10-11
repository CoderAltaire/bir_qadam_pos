import 'package:flutter/foundation.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:http/http.dart' as http;
import 'package:bir_qadam_pos/services/http_result.dart';
import '../models/log/log_model.dart';
import '../models/user/user_model.dart';
import 'hive_helper.dart';

class LogHelper {
  const LogHelper._();
  static final Box _box = HiveBoxes.getLogs();

  static Future addLog(
    String message, {
    String file = '',
    String type = 'FAIL',
    String method = 'POST',
    String path = '/',
    String url = '',
    int statusCode = 200,
  }) async {
    String platform = Platform.isAndroid ? 'Android' : 'iOS';
    UserModel user = AppPrefs.user;

    LogModel log = LogModel(
      dateTime: DateTime.now(),
      isSent: false,
      message: message,
      type: 'FAIL',
      file: file,
      version: '2.5.9+130',
      method: method,
      path: path,
      phone: user.phoneNumber ?? '',
      phoneModel: platform,
      url: "https://",
      statusCode: statusCode,
      userName: '${user.firstName ?? ''} ${user.lastName ?? ""}',
    );
    HttpResult result = await LogService._sendToTelegram(log);

    if (!result.isSuccess) {
      await _box.add(log);
    }
  }
}

/// It sends logs to telegram bot
class LogService {
  const LogService._();
  static Future<HttpResult> _sendToTelegram(LogModel log) async {
    try {
      String message = await _logToString(log);
      Uri url = Uri.parse('${AppSecurityLinks.TELEGRAM_BOT_LINK}$message');

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return HttpResult(statusCode: 200, isSuccess: true, result: '');
      }
      return HttpResult(statusCode: 1000, result: '');
    } catch (err) {
      return HttpResult(statusCode: 1000, result: '');
    }
  }

  static Future<String> _logToString(LogModel log) async {
    const versionUrl = '';
    final String platform = Platform.isAndroid ? 'Android' : 'iOS';
    const String mode = kDebugMode ? 'debug' : 'release';
    final Map deviceInfo = await AppFormatter.getDeviceInfo();
    final String type = log.type == 'FAIL' ? 'Error' : 'Message';
    String userData = '';
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    String? path = log.path?.replaceAll(RegExp(r'[&+]'), '');

    if (log.userName!.trim().isNotEmpty) {
      userData = """<b>User name:</b> ${log.userName}
<b>Phone number:</b> ${log.phone}""";
    }

    final String logString = """
<b>${log.dateTime}</b>
$userData
<b>URL:</b> ${log.url}
<b>Path:</b> $path
<b>Status code:</b> ${log.statusCode} 
<b>Method:</b> ${log.method}
<b>Platform:</b> $platform
<b>Model:</b> ${deviceInfo['name']} ${deviceInfo['model']}
<b>File:</b> ${log.file}
<b>$type:</b> ${log.message}
<b>Opened time</b> ${AppPrefs.counter}
<b>Version</b> <a href = "$versionUrl">$version $buildNumber $mode</a>
""";
    return logString;
  }

  static Future sendFromStorage() async {
    Box<LogModel> box = HiveBoxes.getLogs();
    if (box.isEmpty) return;
    box.values.toList().reversed.toList().forEach((log) async {
      await _sendToTelegram(log).then((value) async {
        if (value.isSuccess) {
          await log.delete();
        }
      });
    });
  }
}
