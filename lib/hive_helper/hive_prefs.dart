import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_boxes.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

class AppPrefs {
  const AppPrefs._();
  static final Box<dynamic> _box = HiveBoxes.prefsBox;
  static late SharedPreferences _pref;
  static Future initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  // Foydalanuvchining ilvaga kirgan sonlarini hisoblaydi
  static Future setCounter() async {
    int count = _box.get(PrefKeys.counter) ?? 0;

    await _box.put(PrefKeys.counter, count + 1);
  }

  static int get counter => _box.get(PrefKeys.counter) ?? 0;



  static UserModel get user => _box.get(PrefKeys.user) ?? UserModel();

  // ======================================================================= //

  /// Forydalanuvchining oxirgi marotaba ilovaga kirgan vaqti
  static Future setLastTime(int time) async {
    await _box.put(PrefKeys.lastOnlineTime, time);
  }

  static int get lastOnlineTime => _box.get(PrefKeys.lastOnlineTime) ?? 0;

  // ======================================================================= //

  // ======================================================================= //

  /// Minimal costni aniqlash uchun
  static Future setMinCost(num cost) async {
    await _box.put(PrefKeys.minCost, cost);
  }

  static num get minCost => _box.get(PrefKeys.minCost) ?? 0;

  // ======================================================================= //

  /// Foydalanuvchining tokenini saqlab qo'yish uchun
  static Future setToken(String token) async {
    await _box.put(PrefKeys.token, token);
  }

  static String get token => _box.get(PrefKeys.token) ?? '';

  // ======================================================================= //
   // ======================================================================= //

  /// Foydalanuvchining tokenini saqlab qo'yish uchun
  static Future setRefreshToken(String token) async {
    await _box.put(PrefKeys.token, token);
  }

  static String get refreshToken => _box.get(PrefKeys.token) ?? '';

  // ======================================================================= //

  // Foydalanuvchining id'sini saqlaydi
  static Future setUserId(String uid) async {
    await _box.put(PrefKeys.uid, uid);
  }

  static String get uid => _box.get(PrefKeys.uid) ?? '';

  // ======================================================================= //

  /// Agar foydalanuvchi to'liq ro'yxatdan o'tgan bo'lsa, true qilinadi
  static Future setCompleted() async => await _box.put(
        PrefKeys.completed,
        true,
      );

  static bool get hasCompleted => _box.get(PrefKeys.completed) ?? false;

  // ======================================================================= //

  @Deprecated("API o'zgargan versiyada foydalanilgan")
  static Future setVersion() async {
    await _box.put(PrefKeys.newVersion, false);
  }

  static bool get version => _box.get(PrefKeys.newVersion) ?? true;

  /// Tilni o'zgarganida saqlash uchun
  static Future setLanguage(String languageCode) async {
    await _box.put(PrefKeys.language, languageCode);
  }

  static String get language => _box.get(PrefKeys.language) ?? 'ru';

  static Future setNotification(bool hasData) async {
    await _box.put(PrefKeys.notification, hasData);
  }

  static bool get hasNotification => _box.get(PrefKeys.notification) ?? false;

  /// Saqlab qo'yilga Feedbackni o'chirish uchun
  static Future deleteFeedback() async => await _box.delete(PrefKeys.feedback);

  // ======= PINCODE ======================================================= //

  /// Pinkodni saqlab qo'yish uchun
  static Future setPincode(String pin) async {
    await _box.put(PrefKeys.pin, pin);
  }

  static String get pin => _box.get(PrefKeys.pin) ?? '';

  // ======= LAST UPDATE PRODUCTS ========================================== //

  /// Mahsulotlaning oxirga yangilangan vaqtini saqlaydi
  static Future<void> setLastUpdateProducts(int updateTime) async {
    await _box.put(PrefKeys.lastUpdate, updateTime);
  }

  /// API'dan mahsulotlar ro'yxatini olib kelayotganda oxirgi yangilangan vaqt
  static int get lastUpdageTimeProducts => _box.get(PrefKeys.lastUpdate) ?? 0;

  /// Foydalanuvchi yangilikni ko'rsa, yangilik id'ni xotiraga saqlab qo'yadi.
  static Future<void> setShownNews(String newsId) async {
    await _box.put(PrefKeys.shownNews, shownNews..add(newsId));
  }

  static List<String> get shownNews => _box.get(PrefKeys.shownNews) ?? [];

// POSDESK ID
  static Future setPosDesk(int id) async =>
      await _box.put(PrefKeys.posdesk, id);

  //  GET POSDESK ID
  static int get getPosDesk => _box.get(PrefKeys.posdesk) ?? 0;

  // ================================================= //
// WereHouse ID
  static Future setWereHouse(int id) async =>
      await _box.put(PrefKeys.werehouse, id);

  //  GET WereHouse ID
  static int get getWereHouse => _box.get(PrefKeys.werehouse) ?? 0;

  // ================================================= //
// branch ID
  static Future setBranch(int id) async => await _box.put(PrefKeys.branch, id);

  //  GET branch ID
  static int get getbranch => _box.get(PrefKeys.branch) ?? 0;

  
  // ======================================================================= //

  /// Forydalanuvchining telefon raqamini saqlash uchun
  static Future setPhone(String phone) async {
    await _box.put(PrefKeys.phone, phone);
  }

  static String get phone => _box.get(PrefKeys.phone) ?? '';

  // ======================================================================= //

  /// PrefBox'dagi berilgan key'dagilarni o'chiradi.
  static Future clearBox() async {
    await _box.deleteAll([
      PrefKeys.token,
      PrefKeys.feedback,
      PrefKeys.completed,
      PrefKeys.language,
      PrefKeys.newVersion,
      PrefKeys.werehouse,
      PrefKeys.branch,
      PrefKeys.phone,

      PrefKeys.notification,
      PrefKeys.user,
      PrefKeys.uid,
      PrefKeys.lastUpdate,
      PrefKeys.shownNews,
    ]);
  }

  //===========*/*/*/*/*/===========
  static String get location => _box.get(PrefKeys.location) ?? '';
  static Future setLocationId(String id) async {
    await _box.put(PrefKeys.location, id);
  }
  //================================
}

/// It's a class that contains static const String variables
class PrefKeys {
  static const String token = 'token';
  static const String werehouse = 'werehouse';
  static const String branch = 'branch';

  static const String user = 'user';
  static const String counter = 'counter';
  static const String pin = 'pin';
  static const String posdesk = 'basket_id';
  static const String completed = 'completed';
  static const String phone = 'phone';
  static const String lastOnlineTime = 'lastOnlineTime';
  static const String minCost = 'min_cost';
  static const String uid = 'uid';
  static const String newVersion = 'new_version';
  static const String language = 'language';
  static const String notification = 'notification';
  static const String feedback = 'feedback';
  static const String lastUpdate = 'last_update';
  static const String shownNews = 'shown_news';
  static const String basket = 'basket';
  static const String location = 'location';
}
