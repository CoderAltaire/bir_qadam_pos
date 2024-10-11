import 'package:bir_qadam_pos/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_helper.dart';
import 'package:path_provider/path_provider.dart' as pp;
// import 'package:bir_qadam_pos/services/unauthorized/unauthorized.dart';

class ApiService {
  const ApiService._();
  static const String _baseUrl = "https://api.bir-qadam.thinkland.uz/api";
  static Map<String, String> _headers() {
    String token = AppPrefs.token;
    if (token.isEmpty)
      return {
        "Content-Type": "application/json",
        "Authorization": 'Basic Kzk5ODIwMTIzNDU2NzoxMjM0NTY3OA=='
      };

    return {
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    };
  }

  static Map<String, String> _headers2() {
    return {
      "Content-Type": "application/json",
    };
  }

  // ===== OPEN SESSION ===== //
  static Future<HttpResult> openSession(String phone, String password) async {
    var body = {
      "phone": phone,
      "password": password,
      "cash_desk": 2,
    };
    return await _post('/collector/merchant/session/start/', body: body);
  }

  // ===== LOGIN ===== //
  static Future<HttpResult> lockedLogin(String phone) async {
    var body = {
      "phone": phone,
    };
    return await _post('/collector/login/', body: body);
  }

// =====  Branch ===== //
  static Future<HttpResult> getBranch() async {
    return await _get(
      '/collector/branch/?is_active=true',
    );
  }

  // ===== Werehouse ===== //
  static Future<HttpResult> getWerehouse(int werehouseId) async {
    return await _get(
      '/collector/warehouse/?branch=$werehouseId',
    );
  }

  // ===== Orders ===== //
  static Future<HttpResult> getOrders(int werehouse,bool isFinished) async {
    return await _get(
      isFinished?
        '/collector/order/?filter=finished&status=collected&warehouse=$werehouse':
      '/collector/order/?status=collected&warehouse=$werehouse',
    
    );
  }

  // ===== Orders with id===== //
  static Future<HttpResult> getOrdersWithId(String id) async {
    return await _get('/collector/order/$id/');
  }

  // ===== CLOSE ORDER  ===== //
  static Future<HttpResult> closeOrder(var body) async {
    return await _post('/collector/pos/order/create/', body: body);
  }

  // ===== CLOSE SESSION ===== //
  static Future<HttpResult> closeSession(
    String phone,
    String password,
    String resAmound,
    String finishedAmound,
    int posdesk,

  ) async {
    var body = {
      "phone": phone,
      "password": password,
      "cash_desk": posdesk,
      "residual_amount": resAmound,
      "finished_amount": finishedAmound
    };
    return await _post('/collector/merchant/session/finish/',
        body: body, isSecondHeader: true);
  }

  static Future<HttpResult> searchProducts(String text) async {
    // return await _get('/invan/get-by-barcode/$barcode');
    return await _get("/collector/product/?q=$text");
  }

  static Future<HttpResult> getProductWithBarcode(String text) async {
    return await _get("/collector/product/?barcode=$text");
  }

  // ===== AUTH ===== //
  static Future<HttpResult> login(String phone) async {
    var body = {"phone_number": phone};
    return await _post('/auth/login', body: body);
  }

  static Future<HttpResult> productList({int page = 1}) async {
    int time = AppPrefs.lastUpdageTimeProducts;
    return await _get('/goods/time/$time?limit=500&page=$page');
  }

  static Future<HttpResult> getMinCost() async {
    String path = "/setting";
    return await _get(path);
  }

// FIND PROMOCODE
  static Future<HttpResult> findPromocode(String promocode) async {
    String path = '/promocode/find-name';
    var body = {"name": promocode};
    return _post(
      path,
      body: body,
    );
  }

  ///////
  static Future<HttpResult> historyOrder() async {
    // String url = "/order/get-mine";
    // var body = {
    //   "limit": 100,
    //   "page": page,
    //   "search": "",
    // };
    // return await _post(
    //   url,
    //   body: body,
    // );
    String url = "/orders";
    return await _get(url);
  }

///////
  static Future<HttpResult> cancelOrder(
    String id,
  ) async {
    String url = "/order/client/cancel";
    var body = {
      "order_id": id,
    };
    return await _post(
      url,
      body: body,
    );
  }

////-*-*-*-*-*-*-*-*-*-*-*Address to Location
  static Future<HttpResult> findLocation(String address) async {
    String url =
        "https://search-maps.yandex.ru/v1/?text=$address&type=geo&lang=uz&apikey=8f391403-5f70-4f0d-8725-83a7317ab397";
    return await _getWithoutBaseUrl(
      url,
    );
  }

  static Future<HttpResult> locationToAddress(double lat, double lon) async {
    String url =
        "https://geocode-maps.yandex.ru/1.x/?apikey=0dfc43ee-47da-49d1-9e93-d568f71705b9&geocode=$lon,$lat&format=json";
    return await _getWithoutBaseUrl(
      url,
    );
  }

  // ============ REQUEST METHODS ============ //

  static Future<HttpResult> _post(
    String path, {
    Object? body,
    bool? isSecondHeader = false,
  }) async {
    Uri url = Uri.parse('$_baseUrl$path');
    try {
      http.Response response = await http
          .post(
            url,
            body: jsonEncode(body),
            headers: isSecondHeader == true ? _headers2() : _headers(),
          )
          .timeout(const Duration(seconds: 30));
      print(response.statusCode);
      print(response.body);
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpResult(
          statusCode: response.statusCode,
          isSuccess: true,
          result: decoded,
        );
      }

      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }

      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),

        path: path,
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
      );
    }
  }

  static Future<HttpResult> _get(
    String path,
  ) async {
    Uri url;

    url = Uri.parse('$_baseUrl$path');

    try {
      http.Response response = await http
          .get(
            url,
            headers: _headers(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);

      var decoded = json.decode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        // result: decoded['message'].toString(),
        result: decoded.toString(),
        path: path,
        method: 'GET',
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
        method: 'GET',
      );
    }
  }

  static Future<HttpResult> _getWithoutBaseUrl(String path) async {
    Uri url = Uri.parse(path);
    try {
      http.Response response = await http
          .get(
            url,
            headers: _headers(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        result: decoded['message'].toString(),
        path: path,
        method: 'GET',
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        path: path,
        method: 'GET',
      );
    }
  }

  static Future<HttpResult> _patch(String path, {Object? body}) async {
    Uri url = Uri.parse('$_baseUrl$path');

    try {
      http.Response response = await http
          .patch(
            url,
            body: jsonEncode(body),
            headers: _headers(),
          )
          .timeout(const Duration(seconds: 30));
      HttpInspector.onResponse(response);
      var decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return HttpResult(
          statusCode: 200,
          isSuccess: true,
          result: decoded,
          method: 'PATCH',
          path: path,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(
        statusCode: response.statusCode,
        result: decoded['message'].toString(),
        method: 'PATCH',
        path: path,
      );
    } catch (err) {
      return HttpResult(
        statusCode: -1,
        result: err,
        method: 'PATCH',
        path: path,
      );
    }
  }

  static Future<HttpResult> uploadImage(
    String path, {
    required List<Uint8List> imgPaths,
    String method = 'POST',
    String field = 'file',
  }) async {
    Uri url = Uri.parse('$_baseUrl$path');
    try {
      var request = http.MultipartRequest(method, url);
      List<http.MultipartFile> files = [];

      for (var imagePath in imgPaths) {
        http.MultipartFile file = http.MultipartFile.fromBytes(
          field,
          imagePath,
          filename: 'img.png',
          contentType: MediaType('image', 'png'),
        );
        files.add(file);
      }
      request.files.addAll(files);
      request.headers.addAll(_headers());
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // HttpInspector.onResponse(response);
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return HttpResult(
          statusCode: statusCode,
          result: response.body,
          isSuccess: true,
        );
      }
      if (response.statusCode == 401) {
        // Unauthorized().onLogoutPresssed();
      }
      return HttpResult(statusCode: statusCode, result: response.body);
    } catch (e) {
      return HttpResult(statusCode: -1, result: e);
    }
  }

  static Future<String> downloadFiles(String uri) async {
    try {
      Uri url = Uri.parse(uri);
      final fileName = uri
          .split('/')
          .last
          .replaceFirst('.jpeg', '.webp')
          .replaceFirst('.jpg', '.webp')
          .replaceFirst('.png', '.webp');
      Directory? directory;

      if (Platform.isAndroid) {
        directory = await pp.getExternalStorageDirectory();
      } else {
        directory = await pp.getApplicationDocumentsDirectory();
      }

      final String filePath = '${directory?.path}/$fileName';
      File file = File(filePath);
      bool exists = await file.exists();

      /// Checking if the file exists in the local storage. If it does, it returns the file path.
      if (exists) {
        return filePath;
      }

      final http.Response response = await http.get(url);

      Uint8List uint8list = await _compressImage(response.bodyBytes);
      await file.writeAsBytes(uint8list.toList());

      return filePath;
    } catch (err) {
      throw Exception('Not downloaded');
    }
  }

  static Future<Uint8List> _compressImage(Uint8List uiInt) async {
    try {
      return await FlutterImageCompress.compressWithList(
        uiInt,
        format: CompressFormat.webp,
      );
    } catch (err) {
      err.printf(name: '_compressImage', isError: true);
      throw Exception(err);
    }
  }
}

class AppStrings {
  static const String INVALID_RESPONSE = 'Неверный ответ';
  static const String SOCKET_EXCEPTION = 'Нет соединения с интернетом';
  static const String FORMAT_ERROR = 'Неверный формат';
  static const String UNKNOWN_ERROR = 'Неизвестная ошибка';
  static const String TIMEOUT_EXCEPTION = 'Исключение тайм-аута';
  static const String HTTP_ERROR = 'HTTP-ошибка';
}
