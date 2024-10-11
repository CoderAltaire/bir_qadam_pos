

import 'package:hive_flutter/hive_flutter.dart';
import '../../hive_helper/hive_helper.dart';
part 'log_model.g.dart';

@HiveType(typeId: HiveTypes.log, adapterName: HiveAdapters.log)
class LogModel extends HiveObject {
  @HiveField(0)
  DateTime? _dateTime;
  @HiveField(1)
  bool? _isSent;
  @HiveField(2)
  String? _message;
  @HiveField(3)
  String? _url;
  @HiveField(4)
  String? _path;
  @HiveField(5)
  String? _method;
  @HiveField(6)
  int? _statusCode;
  @HiveField(7)
  String? _phone;
  @HiveField(8)
  String? _phoneModel;
  @HiveField(9)
  String? _userName;
  @HiveField(10)
  String? _version;
  @HiveField(11)
  String? _type;
  @HiveField(12)
  String? _file;

  LogModel({
    DateTime? dateTime,
    bool? isSent,
    String? message,
    String? url,
    String? path,
    String? method,
    int? statusCode,
    String? phone,
    String? phoneModel,
    String? userName,
    String? version,
    String? type,
    String? file,
  }) {
    if (dateTime != null) {
      _dateTime = dateTime;
    }
    if (isSent != null) {
      _isSent = isSent;
    }
    if (message != null) {
      _message = message;
    }
    if (url != null) {
      _url = url;
    }
    if (path != null) {
      _path = path;
    }
    if (method != null) {
      _method = method;
    }
    if (statusCode != null) {
      _statusCode = statusCode;
    }

    if (phone != null) {
      _phone = phone;
    }
    if (phoneModel != null) {
      _phoneModel = phoneModel;
    }
    if (userName != null) {
      _userName = userName;
    }
    if (version != null) {
      _version = version;
    }
    if (type != null) {
      _type = type;
    }
    if (file != null) {
      _file = file;
    }
  }

  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? dateTime) => _dateTime = dateTime;
  bool? get isSent => _isSent;
  set isSent(bool? isSent) => _isSent = isSent;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get path => _path;
  set path(String? path) => _path = path;
  String? get method => _method;
  set method(String? method) => _method = method;
  int? get statusCode => _statusCode;
  set statusCode(int? statusCode) => _statusCode = statusCode;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get phoneModel => _phoneModel;
  set phoneModel(String? phoneModel) => _phoneModel = phoneModel;
  String? get userName => _userName;
  set userName(String? userName) => _userName = userName;
  String? get version => _version;
  set version(String? version) => _version = version;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get file => _file;
  set file(String? file) => _file = file;

  LogModel.fromJson(Map<String, dynamic> json) {
    _dateTime = json['date_time'];
    _isSent = json['is_sent'];
    _message = json['message'];
    _url = json['url'];
    _path = json['path'];
    _method = json['method'];
    _statusCode = json['status_code'];
    _phone = json['phone'];
    _phoneModel = json['phone_model'];
    _userName = json['user_name'];
    _version = json['version'];
    _type = json['type'];
    _file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_time'] = _dateTime;
    data['is_sent'] = _isSent;
    data['message'] = _message;
    data['url'] = _url;
    data['path'] = _path;
    data['method'] = _method;
    data['status_code'] = _statusCode;
    data['phone'] = _phone;
    data['phone_model'] = _phoneModel;
    data['user_name'] = _userName;
    data['version'] = _version;
    data['type'] = _type;
    data['file'] = _file;
    return data;
  }
}
