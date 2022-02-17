import 'dart:convert';

LoginModelResponse loginDetailsResponse({required String str}) {
  return LoginModelResponse.dataFromJson(json.decode(str));
}

class LoginModelResponse {
  LoginModelResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  LoginModelResponse.dataFromJson(Map<String, dynamic> raw) {
    message = raw['message'];
    data = Data.fromJson(raw['data']);
  }

  Map<String, dynamic> dataToJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.roles,
    required this.token,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final List<String> roles;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['roles'] = roles;
    _data['token'] = token;
    return _data;
  }
}
