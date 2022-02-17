import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mkobo_microbank/models/login_model_response.dart';

/// A SERVICE CLASS TO STORE AND CHECK IF A USER IS LOGGED-IN

class SharedService {
  /// A method to check if the user details exists in the Cache
  static Future<bool> isUserLoggedIn() async {
    var isKeyExists =
        await APICacheManager().isAPICacheKeyExist("login_details");
    return isKeyExists;
  }

  // if it exist then fetch the user's details
  static Future<LoginModelResponse?> loginDetails() async {
    var isKeyExists =
        await APICacheManager().isAPICacheKeyExist("login_details");
    if (isKeyExists) {
      var userDetails = await APICacheManager().getCacheData("login_details");
      return loginDetailsResponse(str: userDetails.syncData);
    }
  }

  static Future<void> setLoginDetails(LoginModelResponse model) async {
    APICacheDBModel dbModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.dataToJson()));
    await APICacheManager().addCacheData(dbModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    // Navigator.push(context, "login_page"); redirects the user to login again
  }
}
