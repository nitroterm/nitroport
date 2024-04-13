// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      username: json['username'] as String,
      password: json['password'] as String,
      reCaptchaChallenge: json['reCaptchaChallenge'] as String?,
      firebaseToken: json['firebaseToken'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'reCaptchaChallenge': instance.reCaptchaChallenge,
      'firebaseToken': instance.firebaseToken,
    };

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['id'] as int,
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      color: json['color'] as int?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'color': instance.color,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      username: json['username'] as String,
      displayName: json['displayName'] as String?,
      bio: json['bio'] as String?,
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'username': instance.username,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'product': instance.product,
    };

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
      id: json['id'] as String,
      sender: UserDto.fromJson(json['sender'] as Map<String, dynamic>),
      message: json['message'] as String,
      nitroLevel: json['nitroLevel'] as int,
      edited: json['edited'] as bool,
      creationDate: DateTime.parse(json['creationDate'] as String),
      editionDate: json['editionDate'] == null
          ? null
          : DateTime.parse(json['editionDate'] as String),
    );

Map<String, dynamic> _$PostDtoToJson(PostDto instance) => <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'message': instance.message,
      'nitroLevel': instance.nitroLevel,
      'edited': instance.edited,
      'creationDate': instance.creationDate.toIso8601String(),
      'editionDate': instance.editionDate?.toIso8601String(),
    };

PostCreationDto _$PostCreationDtoFromJson(Map<String, dynamic> json) =>
    PostCreationDto(
      contents: json['contents'] as String?,
    );

Map<String, dynamic> _$PostCreationDtoToJson(PostCreationDto instance) =>
    <String, dynamic>{
      'contents': instance.contents,
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

FeedResultDto _$FeedResultDtoFromJson(Map<String, dynamic> json) =>
    FeedResultDto(
      success: json['success'] as bool,
      slug: json['slug'] as String?,
      message: json['message'] as String?,
    )..data = (json['data'] as List<dynamic>?)
        ?.map((e) => PostDto.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$FeedResultDtoToJson(FeedResultDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'slug': instance.slug,
      'message': instance.message,
      'data': instance.data,
    };

PostResultDto _$PostResultDtoFromJson(Map<String, dynamic> json) =>
    PostResultDto(
      success: json['success'] as bool,
      slug: json['slug'] as String?,
      message: json['message'] as String?,
    )..data = json['data'] == null
        ? null
        : PostDto.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$PostResultDtoToJson(PostResultDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'slug': instance.slug,
      'message': instance.message,
      'data': instance.data,
    };

UserResultDto _$UserResultDtoFromJson(Map<String, dynamic> json) =>
    UserResultDto(
      success: json['success'] as bool,
      slug: json['slug'] as String?,
      message: json['message'] as String?,
    )..data = json['data'] == null
        ? null
        : UserDto.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$UserResultDtoToJson(UserResultDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'slug': instance.slug,
      'message': instance.message,
      'data': instance.data,
    };
