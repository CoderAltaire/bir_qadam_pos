
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_helper.dart';
part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.user, adapterName: HiveAdapters.user)
class UserModel extends HiveObject {
  @HiveField(0)
  String? _sId;

  @HiveField(1)
  String? _phoneNumber;

  @HiveField(2)
  num? _balance;

  @HiveField(3)
  String? _firstName;

  @HiveField(4)
  String? _lastName;

  @HiveField(5)
  String? _birthDate;

  @HiveField(6)
  String? _gender;

  @HiveField(7)
  String? _password;

  @HiveField(8)
  String? _accessToken;

  @HiveField(9)
  String? _fireaseToken;

  @HiveField(10)
  String? _fullName;

  @HiveField(11)
  UiLanguage? _uiLanguage;

  @HiveField(12)
  bool? _isActive;

  @HiveField(13)
  String? _timezone;

  @HiveField(15)
  String? _token;

  @HiveField(16)
  String? _email;

  @HiveField(17)
  String? _image;

  UserModel({
    String? sId,
    String? firstName,
    String? email,
    String? lastName,
    String? fullName,
    String? phoneNumber,
    String? image,
    String? password,
    UiLanguage? uiLanguage,
    bool? isActive,
    String? timezone,
    String? birthDate,
    String? gender,
    num? balance,
    String? token,
    String? firebaseToken,
    String? accessToken,
  }) {
    if (sId != null) {
      _sId = sId;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (email != null) {
      _email = email;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
    if (phoneNumber != null) {
      _phoneNumber = phoneNumber;
    }
    if (image != null) {
      _image = image;
    }
    if (password != null) {
      _password = password;
    }
    if (uiLanguage != null) {
      _uiLanguage = uiLanguage;
    }
    if (isActive != null) {
      _isActive = isActive;
    }
    if (timezone != null) {
      _timezone = timezone;
    }

    if (balance != null) {
      _balance = balance;
    }

    if (gender != null) {
      _gender = gender;
    }

    if (birthDate != null) {
      _birthDate = birthDate;
    }

    if (token != null) {
      _token = token;
    }

    if (firebaseToken != null) {
      _fireaseToken = firebaseToken;
    }
    if (accessToken != null) {
      _accessToken = accessToken;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get password => _password;
  set password(String? password) => _password = password;
  UiLanguage? get uiLanguage => _uiLanguage;
  set uiLanguage(UiLanguage? uiLanguage) => _uiLanguage = uiLanguage;
  bool? get isActive => _isActive;
  set isActive(bool? isActive) => _isActive = isActive;
  String? get timezone => _timezone;
  set timezone(String? timezone) => _timezone = timezone;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get birthDate => _birthDate;
  set birthDate(String? birthDate) => _birthDate = birthDate;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  num? get balance => _balance;
  set balance(num? balance) => _balance = balance;
  String? get firebaseToken => _fireaseToken;
  set firebaseToken(String? fToken) => _fireaseToken = fToken;
  String? get accessToken => _accessToken;
  set accessToken(String? token) => _accessToken = token;

  UserModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _firstName = json['first_name'];
    _email = json['email'];
    _lastName = json['last_name'];
    _fullName = json['full_name'];
    _phoneNumber = json['phone_number'];
    _image = json['image'] ?? '';
    _gender = json['gender'] ?? 'not_set';
    _fireaseToken = json['firbase_token'];
    _birthDate = json['birthdate'] ?? '';
    _balance = json['balance'] ?? 0;
    _password = json['password'];
    _token = json['access_token'];
    _uiLanguage = json['ui_language'] != null
        ? UiLanguage.fromJson(json['ui_language'])
        : null;
    _isActive = json['is_active'];
    _timezone = json['timezone'];
    _accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = _sId;
    data['first_name'] = _firstName;
    data['email'] = _email;
    data['last_name'] = _lastName;
    data['full_name'] = _fullName;
    data['phone_number'] = _phoneNumber;
    data['image'] = _image;
    data['gender'] = _gender;
    data['balance'] = _balance;
    data['birthdate'] = _birthDate;
    data['access_token'] = _token;
    data['password'] = _password;
    data['firbase_token'] = _fireaseToken;
    if (_uiLanguage != null) {
      data['ui_language'] = _uiLanguage!.toJson();
    }
    data['is_active'] = _isActive;
    data['timezone'] = _timezone;
    data['access_token'] = _accessToken;

    return data;
  }

  Map<String, dynamic> toApi() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;
    data['full_name'] = _fullName;
    data['phone_number'] = _phoneNumber;
    data['gender'] = _gender ?? 'not_set';
    data['birthdate'] = _birthDate ?? '';
    if (_uiLanguage != null) {
      data['ui_language'] = _uiLanguage!.toJson();
    }
    data['is_active'] = _isActive;
    data['timezone'] = _timezone;
    data['firbase_token'] = _fireaseToken;

    return data;
  }
}

@HiveType(typeId: HiveTypes.uiLanguage, adapterName: HiveAdapters.uiLanguage)
class UiLanguage {
  @HiveField(0)
  String? _text;

  @HiveField(1)
  String? _value;

  UiLanguage({String? text, String? value}) {
    if (text != null) {
      _text = text;
    }
    if (value != null) {
      _value = value;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;
  String? get value => _value;
  set value(String? value) => _value = value;

  UiLanguage.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = _text;
    data['value'] = _value;
    return data;
  }
}
