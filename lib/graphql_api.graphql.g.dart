// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserLsps$QueryRoot$UserLspMap _$GetUserLsps$QueryRoot$UserLspMapFromJson(
        Map<String, dynamic> json) =>
    GetUserLsps$QueryRoot$UserLspMap()
      ..userLspId = json['user_lsp_id'] as String?
      ..userId = json['user_id'] as String
      ..lspId = json['lsp_id'] as String
      ..status = json['status'] as String
      ..createdAt = json['created_at'] as String
      ..updatedAt = json['updated_at'] as String
      ..createdBy = json['created_by'] as String?
      ..updatedBy = json['updated_by'] as String?;

Map<String, dynamic> _$GetUserLsps$QueryRoot$UserLspMapToJson(
        GetUserLsps$QueryRoot$UserLspMap instance) =>
    <String, dynamic>{
      'user_lsp_id': instance.userLspId,
      'user_id': instance.userId,
      'lsp_id': instance.lspId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

GetUserLsps$QueryRoot _$GetUserLsps$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserLsps$QueryRoot()
      ..getUserLsps = (json['getUserLsps'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetUserLsps$QueryRoot$UserLspMap.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUserLsps$QueryRootToJson(
        GetUserLsps$QueryRoot instance) =>
    <String, dynamic>{
      'getUserLsps': instance.getUserLsps?.map((e) => e?.toJson()).toList(),
    };

Login$MutationRoot$User _$Login$MutationRoot$UserFromJson(
        Map<String, dynamic> json) =>
    Login$MutationRoot$User()
      ..id = json['id'] as String?
      ..firstName = json['first_name'] as String
      ..lastName = json['last_name'] as String
      ..status = json['status'] as String
      ..role = json['role'] as String
      ..isVerified = json['is_verified'] as bool
      ..isActive = json['is_active'] as bool
      ..gender = json['gender'] as String
      ..createdBy = json['created_by'] as String?
      ..updatedBy = json['updated_by'] as String?
      ..createdAt = json['created_at'] as String
      ..updatedAt = json['updated_at'] as String
      ..email = json['email'] as String
      ..phone = json['phone'] as String
      ..photoUrl = json['photo_url'] as String?;

Map<String, dynamic> _$Login$MutationRoot$UserToJson(
        Login$MutationRoot$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'status': instance.status,
      'role': instance.role,
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'gender': instance.gender,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'email': instance.email,
      'phone': instance.phone,
      'photo_url': instance.photoUrl,
    };

Login$MutationRoot _$Login$MutationRootFromJson(Map<String, dynamic> json) =>
    Login$MutationRoot()
      ..login = json['login'] == null
          ? null
          : Login$MutationRoot$User.fromJson(
              json['login'] as Map<String, dynamic>);

Map<String, dynamic> _$Login$MutationRootToJson(Login$MutationRoot instance) =>
    <String, dynamic>{
      'login': instance.login?.toJson(),
    };

GetUserLspsArguments _$GetUserLspsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserLspsArguments(
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$GetUserLspsArgumentsToJson(
        GetUserLspsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };
