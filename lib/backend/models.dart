import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class LoginDto {
  LoginDto({required this.username, required this.password, this.reCaptchaChallenge});

  String username;
  String password;
  String? reCaptchaChallenge;

  factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}

@JsonSerializable()
class LoginResponseDto {
  LoginResponseDto({required this.token});

  String token;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}

abstract class ResultDto {
  ResultDto({required this.success, this.slug, this.message});

  bool success;
  String? slug;
  String? message;
}

@JsonSerializable()
class LoginResultDto extends ResultDto {
  LoginResultDto({required super.success, super.slug, super.message});

  LoginResponseDto? data;

  factory LoginResultDto.fromJson(Map<String, dynamic> json) => _$LoginResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultDtoToJson(this);
}