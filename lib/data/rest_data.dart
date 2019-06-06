import 'dart:async';

import 'package:flutter_app_sqlite_master/models/user.dart';
import 'package:flutter_app_sqlite_master/models/UserDetail.dart';
import 'package:flutter_app_sqlite_master/models/gender.dart';
import 'package:flutter_app_sqlite_master/utils/network_util.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://YOUR_BACKEND_IP/login_app_backend";
  static final LOGIN_URL = BASE_URL + "/login.php";
  static final SERVICE_URL = BASE_URL + "/login.php";
  static final _API_KEY = "somerandomkey";

//  Future<User> login(String username, String password) {
//    return new Future.value(new User(username, password));
//  }
  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }

  Future<Gender> ageSelection(String Age) {
    return new Future.value(new Gender(Age));
  }
  Future<SelectedServicesModel> servicesave(int categoryid, String categoryName, int serviceId, String serviceName, int count) {
    return _netUtil.post(SERVICE_URL, body: {
      "token": _API_KEY,
      "categoryid": categoryid,
      "categoryName": categoryName,
      "serviceName": serviceId,
      "categoryName": serviceName,
      "count": count
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new SelectedServicesModel.map(res["Services"]);
    });
  }

//  Future<SelectedServicesModel> servicesave(int categoryid, String categoryName, int serviceId, String serviceName, int count) {
//    return new Future.value(new SelectedServicesModel());
//  }

}
