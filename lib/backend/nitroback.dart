import 'dart:convert';
import 'dart:io';

import 'package:nitroport/backend/models.dart';
import 'package:http/http.dart' as http;

import '../utils/storage.dart';

const String nbBaseUrl = "https://services.cacahuete.dev/api/nitroterm/v1";
String? nbToken;
UserDto? nbCurrentUser;

Future<bool> nbTryLoadTokenFromSecureStorage() async {
  if (await storage.containsKey(key: 'token')) {
    nbToken = await storage.read(key: 'token');
    UserResultDto? result = await nbGetLoggedInUser();
    if (!result!.success) return false;

    nbCurrentUser = result.data;

    return true;
  }

  return false;
}

Future<LoginResultDto?> nbLogin(
    String username, String password, String firebaseToken) async {
  LoginDto dto = LoginDto(
      username: username, password: password, firebaseToken: firebaseToken);
  var bodyJson = jsonEncode(dto.toJson());

  final response = await http
      .post(Uri.parse('$nbBaseUrl/auth/login'), body: bodyJson, headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return LoginResultDto(
        success: false,
        slug: "too_many_requests",
        message: "Too many requests");
  }

  LoginResultDto result = LoginResultDto.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>);

  if (result.success) {
    nbToken = result.data!.token;
    nbCurrentUser = result.data!.user;

    await storage.write(key: 'token', value: nbToken);
  }

  return result;
}

Future<PostResultDto?> nbPostMessage(String contents) async {
  PostCreationDto dto = PostCreationDto(contents: contents);
  var bodyJson = jsonEncode(dto.toJson());

  final response =
      await http.post(Uri.parse('$nbBaseUrl/post'), body: bodyJson, headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value,
    if (nbToken != null) HttpHeaders.authorizationHeader: 'Bearer $nbToken'
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return PostResultDto(
        success: false,
        slug: "too_many_requests",
        message: "Too many requests");
  }

  PostResultDto result =
      PostResultDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

  return result;
}

Future<UserResultDto?> nbGetLoggedInUser() async {
  final response = await http.get(Uri.parse('$nbBaseUrl/user'), headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value,
    if (nbToken != null) HttpHeaders.authorizationHeader: 'Bearer $nbToken'
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return UserResultDto(
        success: false,
        slug: "too_many_requests",
        message: "Too many requests");
  }

  UserResultDto result =
  UserResultDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

  return result;
}

Future<FeedResultDto?> nbGetFeed() async {
  final response = await http.get(Uri.parse('$nbBaseUrl/feed'), headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value,
    if (nbToken != null) HttpHeaders.authorizationHeader: 'Bearer $nbToken'
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return FeedResultDto(
        success: false,
        slug: "too_many_requests",
        message: "Too many requests");
  }

  FeedResultDto result =
      FeedResultDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

  return result;
}

Future<PostResultDto?> nbGetPost(String id) async {
  final response = await http.get(Uri.parse('$nbBaseUrl/posts/$id'), headers: {
    HttpHeaders.contentTypeHeader: ContentType.json.value,
    if (nbToken != null) HttpHeaders.authorizationHeader: 'Bearer $nbToken'
  });

  if (response.statusCode == HttpStatus.tooManyRequests) {
    return PostResultDto(
        success: false,
        slug: "too_many_requests",
        message: "Too many requests");
  }

  PostResultDto result =
  PostResultDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

  return result;
}