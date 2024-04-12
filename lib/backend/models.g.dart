// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      username: json['username'] as String,
      password: json['password'] as String,
      reCaptchaChallenge: json['reCaptchaChallenge'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'reCaptchaChallenge': instance.reCaptchaChallenge,
    };

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LoginResultDto _$LoginResultDtoFromJson(Map<String, dynamic> json) =>
    LoginResultDto(
      success: json['success'] as bool,
      slug: json['slug'] as String?,
      message: json['message'] as String?,
    )..data = json['data'] == null
        ? null
        : LoginResponseDto.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginResultDtoToJson(LoginResultDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'slug': instance.slug,
      'message': instance.message,
      'data': instance.data,
    };
