import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mkobo_microbank/config.dart';
import 'package:mkobo_microbank/models/login_model_request.dart';
import 'package:mkobo_microbank/models/login_model_response.dart';
import 'shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequest model) async {
    Map<String, String> requestHeaders = {
      "content-Type": "application/json",
    };
    var url = Uri.http(Config.apiURL, Config.loginApi);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      /// STORE USER INFO IN SHARED SERVICES
      await SharedService.setLoginDetails(
          loginDetailsResponse(str: response.body));
      return true;
    } else {
      return false;
    }
  }
}
