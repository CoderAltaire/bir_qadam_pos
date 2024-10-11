import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_helper.dart';
import 'package:bir_qadam_pos/services/services.dart';

class HttpResult {
  bool isSuccess;
  int statusCode;
  dynamic result;
  String path;
  String method;
  HttpResult({
    required this.statusCode,
    required this.result,
    this.isSuccess = false,
    this.path = '/',
    this.method = 'POST',
  }) {
    if (isSuccess) return;

    if (result is SocketException) return;
    if (result is TimeoutException) return;
    if (path.contains('/seen_news')) return;
    if (statusCode == 1000) return;

    String error;
    if (result is HttpException) {
      error = AppStrings.HTTP_ERROR;
    } else if (result is FormatException) {
      error = AppStrings.FORMAT_ERROR;
    } else {
      error = result.toString();
    }

    // Via this function, errors that occur with the API are saved.
    LogHelper.addLog(
      error,
      path: path.replaceAll('&', ''),
      file: 'http_result',
      method: method,
      statusCode: statusCode,
    );
  }

  // Simple way to get a data
  dynamic getData() {
    if (isSuccess) {
      return result;
    }

    if (result is SocketException) {
      return AppStrings.SOCKET_EXCEPTION;
    } else if (result is TimeoutException) {
      return AppStrings.TIMEOUT_EXCEPTION;
    } else if (result is HttpException) {
      return AppStrings.HTTP_ERROR;
    } else if (result is FormatException) {
      return AppStrings.FORMAT_ERROR;
    } else {
      return AppStrings.UNKNOWN_ERROR;
    }
  }
}
