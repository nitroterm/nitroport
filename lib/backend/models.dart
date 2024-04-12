import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class LoginDto {
  LoginDto(
      {required this.username,
      required this.password,
      this.reCaptchaChallenge,
      this.firebaseToken});

  String username;
  String password;
  String? reCaptchaChallenge;
  String? firebaseToken;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}

@JsonSerializable()
class ProductDto {
  ProductDto(
      {required this.id,
      required this.slug,
      required this.title,
      required this.color});

  int id;
  String? slug;
  String? title;
  int? color;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

@JsonSerializable()
class UserDto {
  UserDto(
      {required this.username,
      required this.displayName,
      required this.bio,
      required this.product});

  String username;
  String? displayName;
  String? bio;
  ProductDto? product;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class LoginResponseDto {
  LoginResponseDto({required this.token, required this.user});

  String token;
  UserDto user;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}

@JsonSerializable()
class PostDto {
  PostDto(
      {required this.id,
      required this.sender,
      required this.message,
      required this.nitroLevel,
      required this.edited,
      required this.creationDate,
      this.editionDate});

  String id;
  UserDto sender;
  String message;
  int nitroLevel;
  bool edited;
  DateTime creationDate;
  DateTime? editionDate;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}

abstract class ResultDto {
  ResultDto({required this.success, this.slug, this.message});

  bool success;
  String? slug;
  String? message;
}

@JsonSerializable()
class PostCreationDto {
  PostCreationDto({required this.contents});

  String? contents;

  factory PostCreationDto.fromJson(Map<String, dynamic> json) =>
      _$PostCreationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostCreationDtoToJson(this);
}

@JsonSerializable()
class LoginResultDto extends ResultDto {
  LoginResultDto({required super.success, super.slug, super.message});

  LoginResponseDto? data;

  factory LoginResultDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultDtoToJson(this);
}

@JsonSerializable()
class FeedResultDto extends ResultDto {
  FeedResultDto({required super.success, super.slug, super.message});

  List<PostDto>? data;

  factory FeedResultDto.fromJson(Map<String, dynamic> json) =>
      _$FeedResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeedResultDtoToJson(this);
}

@JsonSerializable()
class PostResultDto extends ResultDto {
  PostResultDto({required super.success, super.slug, super.message});

  PostDto? data;

  factory PostResultDto.fromJson(Map<String, dynamic> json) =>
      _$PostResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostResultDtoToJson(this);
}