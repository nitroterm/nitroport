import 'dart:convert';
import 'dart:io';

import 'package:nitroport/backend/models.dart';
import 'package:http/http.dart' as http;

const String nbBaseUrl = "https://services.cacahuete.dev/api/nitroterm/v1";
String? nbToken;

Future<LoginResultDto?> nbLogin(String username, String password) async {
  LoginDto dto = LoginDto(username: username, password: password);
  var bodyJson = jsonEncode(dto.toJson());

  final response =
  await http.post(Uri.parse('$nbBaseUrl/auth/login'), body: bodyJson, headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value,
    if (nbToken != null) HttpHeaders.authorizationHeader: 'Bearer $nbToken'
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return LoginResultDto(success: false, slug: "too_many_requests", message: "Too many requests");
  }

  LoginResultDto result = LoginResultDto.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>);

  if (result.success) {
    nbToken = result.data!.token;
  }

  return result;
}