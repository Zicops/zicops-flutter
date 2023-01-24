// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUser$MutationRoot$User _$UpdateUser$MutationRoot$UserFromJson(
        Map<String, dynamic> json) =>
    UpdateUser$MutationRoot$User()
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

Map<String, dynamic> _$UpdateUser$MutationRoot$UserToJson(
        UpdateUser$MutationRoot$User instance) =>
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

UpdateUser$MutationRoot _$UpdateUser$MutationRootFromJson(
        Map<String, dynamic> json) =>
    UpdateUser$MutationRoot()
      ..updateUser = json['updateUser'] == null
          ? null
          : UpdateUser$MutationRoot$User.fromJson(
              json['updateUser'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateUser$MutationRootToJson(
        UpdateUser$MutationRoot instance) =>
    <String, dynamic>{
      'updateUser': instance.updateUser?.toJson(),
    };

AddUserOrganizationMap$MutationRoot$UserOrganizationMap
    _$AddUserOrganizationMap$MutationRoot$UserOrganizationMapFromJson(
            Map<String, dynamic> json) =>
        AddUserOrganizationMap$MutationRoot$UserOrganizationMap()
          ..userOrganizationId = json['user_organization_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..organizationId = json['organization_id'] as String
          ..organizationRole = json['organization_role'] as String
          ..isActive = json['is_active'] as bool
          ..employeeId = json['employee_id'] as String;

Map<String, dynamic>
    _$AddUserOrganizationMap$MutationRoot$UserOrganizationMapToJson(
            AddUserOrganizationMap$MutationRoot$UserOrganizationMap instance) =>
        <String, dynamic>{
          'user_organization_id': instance.userOrganizationId,
          'user_id': instance.userId,
          'user_lsp_id': instance.userLspId,
          'organization_id': instance.organizationId,
          'organization_role': instance.organizationRole,
          'is_active': instance.isActive,
          'employee_id': instance.employeeId,
        };

AddUserOrganizationMap$MutationRoot
    _$AddUserOrganizationMap$MutationRootFromJson(Map<String, dynamic> json) =>
        AddUserOrganizationMap$MutationRoot()
          ..addUserOrganizationMap = json['addUserOrganizationMap'] == null
              ? null
              : AddUserOrganizationMap$MutationRoot$UserOrganizationMap
                  .fromJson(
                      json['addUserOrganizationMap'] as Map<String, dynamic>);

Map<String, dynamic> _$AddUserOrganizationMap$MutationRootToJson(
        AddUserOrganizationMap$MutationRoot instance) =>
    <String, dynamic>{
      'addUserOrganizationMap': instance.addUserOrganizationMap?.toJson(),
    };

UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap
    _$UpdateUserOrganizationMap$MutationRoot$UserOrganizationMapFromJson(
            Map<String, dynamic> json) =>
        UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap()
          ..userOrganizationId = json['user_organization_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..organizationId = json['organization_id'] as String
          ..organizationRole = json['organization_role'] as String
          ..isActive = json['is_active'] as bool
          ..employeeId = json['employee_id'] as String;

Map<String,
    dynamic> _$UpdateUserOrganizationMap$MutationRoot$UserOrganizationMapToJson(
        UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap instance) =>
    <String, dynamic>{
      'user_organization_id': instance.userOrganizationId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'organization_id': instance.organizationId,
      'organization_role': instance.organizationRole,
      'is_active': instance.isActive,
      'employee_id': instance.employeeId,
    };

UpdateUserOrganizationMap$MutationRoot
    _$UpdateUserOrganizationMap$MutationRootFromJson(
            Map<String, dynamic> json) =>
        UpdateUserOrganizationMap$MutationRoot()
          ..updateUserOrganizationMap =
              json['updateUserOrganizationMap'] == null
                  ? null
                  : UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap
                      .fromJson(json['updateUserOrganizationMap']
                          as Map<String, dynamic>);

Map<String, dynamic> _$UpdateUserOrganizationMap$MutationRootToJson(
        UpdateUserOrganizationMap$MutationRoot instance) =>
    <String, dynamic>{
      'updateUserOrganizationMap': instance.updateUserOrganizationMap?.toJson(),
    };

AddUserPreference$MutationRoot$UserPreference
    _$AddUserPreference$MutationRoot$UserPreferenceFromJson(
            Map<String, dynamic> json) =>
        AddUserPreference$MutationRoot$UserPreference()
          ..userPreferenceId = json['user_preference_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..subCategory = json['sub_category'] as String
          ..isBase = json['is_base'] as bool
          ..isActive = json['is_active'] as bool;

Map<String, dynamic> _$AddUserPreference$MutationRoot$UserPreferenceToJson(
        AddUserPreference$MutationRoot$UserPreference instance) =>
    <String, dynamic>{
      'user_preference_id': instance.userPreferenceId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'sub_category': instance.subCategory,
      'is_base': instance.isBase,
      'is_active': instance.isActive,
    };

AddUserPreference$MutationRoot _$AddUserPreference$MutationRootFromJson(
        Map<String, dynamic> json) =>
    AddUserPreference$MutationRoot()
      ..addUserPreference = (json['addUserPreference'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddUserPreference$MutationRoot$UserPreference.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AddUserPreference$MutationRootToJson(
        AddUserPreference$MutationRoot instance) =>
    <String, dynamic>{
      'addUserPreference':
          instance.addUserPreference?.map((e) => e?.toJson()).toList(),
    };

UpdateUserPreference$MutationRoot$UserPreference
    _$UpdateUserPreference$MutationRoot$UserPreferenceFromJson(
            Map<String, dynamic> json) =>
        UpdateUserPreference$MutationRoot$UserPreference()
          ..userPreferenceId = json['user_preference_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..subCategory = json['sub_category'] as String
          ..isBase = json['is_base'] as bool
          ..isActive = json['is_active'] as bool;

Map<String, dynamic> _$UpdateUserPreference$MutationRoot$UserPreferenceToJson(
        UpdateUserPreference$MutationRoot$UserPreference instance) =>
    <String, dynamic>{
      'user_preference_id': instance.userPreferenceId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'sub_category': instance.subCategory,
      'is_base': instance.isBase,
      'is_active': instance.isActive,
    };

UpdateUserPreference$MutationRoot _$UpdateUserPreference$MutationRootFromJson(
        Map<String, dynamic> json) =>
    UpdateUserPreference$MutationRoot()
      ..updateUserPreference = json['updateUserPreference'] == null
          ? null
          : UpdateUserPreference$MutationRoot$UserPreference.fromJson(
              json['updateUserPreference'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateUserPreference$MutationRootToJson(
        UpdateUserPreference$MutationRoot instance) =>
    <String, dynamic>{
      'updateUserPreference': instance.updateUserPreference?.toJson(),
    };

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

GetUserLspByLspId$QueryRoot$UserLspMap
    _$GetUserLspByLspId$QueryRoot$UserLspMapFromJson(
            Map<String, dynamic> json) =>
        GetUserLspByLspId$QueryRoot$UserLspMap()
          ..userLspId = json['user_lsp_id'] as String?
          ..userId = json['user_id'] as String
          ..lspId = json['lsp_id'] as String
          ..status = json['status'] as String
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?;

Map<String, dynamic> _$GetUserLspByLspId$QueryRoot$UserLspMapToJson(
        GetUserLspByLspId$QueryRoot$UserLspMap instance) =>
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

GetUserLspByLspId$QueryRoot _$GetUserLspByLspId$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserLspByLspId$QueryRoot()
      ..getUserLspByLspId = json['getUserLspByLspId'] == null
          ? null
          : GetUserLspByLspId$QueryRoot$UserLspMap.fromJson(
              json['getUserLspByLspId'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserLspByLspId$QueryRootToJson(
        GetUserLspByLspId$QueryRoot instance) =>
    <String, dynamic>{
      'getUserLspByLspId': instance.getUserLspByLspId?.toJson(),
    };

GetUserOrganizations$QueryRoot$UserOrganizationMap
    _$GetUserOrganizations$QueryRoot$UserOrganizationMapFromJson(
            Map<String, dynamic> json) =>
        GetUserOrganizations$QueryRoot$UserOrganizationMap()
          ..userOrganizationId = json['user_organization_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..organizationId = json['organization_id'] as String
          ..organizationRole = json['organization_role'] as String
          ..isActive = json['is_active'] as bool
          ..employeeId = json['employee_id'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$GetUserOrganizations$QueryRoot$UserOrganizationMapToJson(
        GetUserOrganizations$QueryRoot$UserOrganizationMap instance) =>
    <String, dynamic>{
      'user_organization_id': instance.userOrganizationId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'organization_id': instance.organizationId,
      'organization_role': instance.organizationRole,
      'is_active': instance.isActive,
      'employee_id': instance.employeeId,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserOrganizations$QueryRoot _$GetUserOrganizations$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserOrganizations$QueryRoot()
      ..getUserOrganizations = (json['getUserOrganizations'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetUserOrganizations$QueryRoot$UserOrganizationMap.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUserOrganizations$QueryRootToJson(
        GetUserOrganizations$QueryRoot instance) =>
    <String, dynamic>{
      'getUserOrganizations':
          instance.getUserOrganizations?.map((e) => e?.toJson()).toList(),
    };

GetUserOrgDetails$QueryRoot$UserOrganizationMap
    _$GetUserOrgDetails$QueryRoot$UserOrganizationMapFromJson(
            Map<String, dynamic> json) =>
        GetUserOrgDetails$QueryRoot$UserOrganizationMap()
          ..userOrganizationId = json['user_organization_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..organizationId = json['organization_id'] as String
          ..organizationRole = json['organization_role'] as String
          ..isActive = json['is_active'] as bool
          ..employeeId = json['employee_id'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$GetUserOrgDetails$QueryRoot$UserOrganizationMapToJson(
        GetUserOrgDetails$QueryRoot$UserOrganizationMap instance) =>
    <String, dynamic>{
      'user_organization_id': instance.userOrganizationId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'organization_id': instance.organizationId,
      'organization_role': instance.organizationRole,
      'is_active': instance.isActive,
      'employee_id': instance.employeeId,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserOrgDetails$QueryRoot _$GetUserOrgDetails$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserOrgDetails$QueryRoot()
      ..getUserOrgDetails = json['getUserOrgDetails'] == null
          ? null
          : GetUserOrgDetails$QueryRoot$UserOrganizationMap.fromJson(
              json['getUserOrgDetails'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserOrgDetails$QueryRootToJson(
        GetUserOrgDetails$QueryRoot instance) =>
    <String, dynamic>{
      'getUserOrgDetails': instance.getUserOrgDetails?.toJson(),
    };

AllCatMain$QueryRoot$CatMain _$AllCatMain$QueryRoot$CatMainFromJson(
        Map<String, dynamic> json) =>
    AllCatMain$QueryRoot$CatMain()
      ..id = json['id'] as String?
      ..name = json['Name'] as String?
      ..description = json['Description'] as String?
      ..imageUrl = json['ImageUrl'] as String?
      ..code = json['Code'] as String?
      ..createdAt = json['CreatedAt'] as String?
      ..updatedAt = json['UpdatedAt'] as String?
      ..createdBy = json['CreatedBy'] as String?
      ..updatedBy = json['UpdatedBy'] as String?
      ..isActive = json['IsActive'] as bool?;

Map<String, dynamic> _$AllCatMain$QueryRoot$CatMainToJson(
        AllCatMain$QueryRoot$CatMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'ImageUrl': instance.imageUrl,
      'Code': instance.code,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsActive': instance.isActive,
    };

AllCatMain$QueryRoot _$AllCatMain$QueryRootFromJson(
        Map<String, dynamic> json) =>
    AllCatMain$QueryRoot()
      ..allCatMain = (json['allCatMain'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AllCatMain$QueryRoot$CatMain.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AllCatMain$QueryRootToJson(
        AllCatMain$QueryRoot instance) =>
    <String, dynamic>{
      'allCatMain': instance.allCatMain?.map((e) => e?.toJson()).toList(),
    };

AllSubCatMain$QueryRoot$SubCatMain _$AllSubCatMain$QueryRoot$SubCatMainFromJson(
        Map<String, dynamic> json) =>
    AllSubCatMain$QueryRoot$SubCatMain()
      ..id = json['id'] as String?
      ..name = json['Name'] as String?
      ..description = json['Description'] as String?
      ..imageUrl = json['ImageUrl'] as String?
      ..code = json['Code'] as String?
      ..catId = json['CatId'] as String?
      ..createdAt = json['CreatedAt'] as String?
      ..updatedAt = json['UpdatedAt'] as String?
      ..createdBy = json['CreatedBy'] as String?
      ..updatedBy = json['UpdatedBy'] as String?
      ..isActive = json['IsActive'] as bool?;

Map<String, dynamic> _$AllSubCatMain$QueryRoot$SubCatMainToJson(
        AllSubCatMain$QueryRoot$SubCatMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'ImageUrl': instance.imageUrl,
      'Code': instance.code,
      'CatId': instance.catId,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsActive': instance.isActive,
    };

AllSubCatMain$QueryRoot _$AllSubCatMain$QueryRootFromJson(
        Map<String, dynamic> json) =>
    AllSubCatMain$QueryRoot()
      ..allSubCatMain = (json['allSubCatMain'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AllSubCatMain$QueryRoot$SubCatMain.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AllSubCatMain$QueryRootToJson(
        AllSubCatMain$QueryRoot instance) =>
    <String, dynamic>{
      'allSubCatMain': instance.allSubCatMain?.map((e) => e?.toJson()).toList(),
    };

AllSubCatByCatId$QueryRoot$SubCatMain
    _$AllSubCatByCatId$QueryRoot$SubCatMainFromJson(
            Map<String, dynamic> json) =>
        AllSubCatByCatId$QueryRoot$SubCatMain()
          ..id = json['id'] as String?
          ..name = json['Name'] as String?
          ..description = json['Description'] as String?
          ..imageUrl = json['ImageUrl'] as String?
          ..code = json['Code'] as String?
          ..catId = json['CatId'] as String?
          ..createdAt = json['CreatedAt'] as String?
          ..updatedAt = json['UpdatedAt'] as String?
          ..createdBy = json['CreatedBy'] as String?
          ..updatedBy = json['UpdatedBy'] as String?
          ..isActive = json['IsActive'] as bool?;

Map<String, dynamic> _$AllSubCatByCatId$QueryRoot$SubCatMainToJson(
        AllSubCatByCatId$QueryRoot$SubCatMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'ImageUrl': instance.imageUrl,
      'Code': instance.code,
      'CatId': instance.catId,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsActive': instance.isActive,
    };

AllSubCatByCatId$QueryRoot _$AllSubCatByCatId$QueryRootFromJson(
        Map<String, dynamic> json) =>
    AllSubCatByCatId$QueryRoot()
      ..allSubCatByCatId = (json['allSubCatByCatId'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AllSubCatByCatId$QueryRoot$SubCatMain.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AllSubCatByCatId$QueryRootToJson(
        AllSubCatByCatId$QueryRoot instance) =>
    <String, dynamic>{
      'allSubCatByCatId':
          instance.allSubCatByCatId?.map((e) => e?.toJson()).toList(),
    };

GetUserPreferences$QueryRoot$UserPreference
    _$GetUserPreferences$QueryRoot$UserPreferenceFromJson(
            Map<String, dynamic> json) =>
        GetUserPreferences$QueryRoot$UserPreference()
          ..userPreferenceId = json['user_preference_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..subCategory = json['sub_category'] as String
          ..isBase = json['is_base'] as bool
          ..isActive = json['is_active'] as bool
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$GetUserPreferences$QueryRoot$UserPreferenceToJson(
        GetUserPreferences$QueryRoot$UserPreference instance) =>
    <String, dynamic>{
      'user_preference_id': instance.userPreferenceId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'sub_category': instance.subCategory,
      'is_base': instance.isBase,
      'is_active': instance.isActive,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserPreferences$QueryRoot _$GetUserPreferences$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserPreferences$QueryRoot()
      ..getUserPreferences = (json['getUserPreferences'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetUserPreferences$QueryRoot$UserPreference.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUserPreferences$QueryRootToJson(
        GetUserPreferences$QueryRoot instance) =>
    <String, dynamic>{
      'getUserPreferences':
          instance.getUserPreferences?.map((e) => e?.toJson()).toList(),
    };

GetUserPreferenceForLsp$QueryRoot$UserPreference
    _$GetUserPreferenceForLsp$QueryRoot$UserPreferenceFromJson(
            Map<String, dynamic> json) =>
        GetUserPreferenceForLsp$QueryRoot$UserPreference()
          ..userPreferenceId = json['user_preference_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..subCategory = json['sub_category'] as String
          ..isBase = json['is_base'] as bool
          ..isActive = json['is_active'] as bool
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$GetUserPreferenceForLsp$QueryRoot$UserPreferenceToJson(
        GetUserPreferenceForLsp$QueryRoot$UserPreference instance) =>
    <String, dynamic>{
      'user_preference_id': instance.userPreferenceId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'sub_category': instance.subCategory,
      'is_base': instance.isBase,
      'is_active': instance.isActive,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserPreferenceForLsp$QueryRoot _$GetUserPreferenceForLsp$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserPreferenceForLsp$QueryRoot()
      ..getUserPreferenceForLsp = json['getUserPreferenceForLsp'] == null
          ? null
          : GetUserPreferenceForLsp$QueryRoot$UserPreference.fromJson(
              json['getUserPreferenceForLsp'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserPreferenceForLsp$QueryRootToJson(
        GetUserPreferenceForLsp$QueryRoot instance) =>
    <String, dynamic>{
      'getUserPreferenceForLsp': instance.getUserPreferenceForLsp?.toJson(),
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

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) =>
    UpdateUserArguments(
      id: json['id'] as String?,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      status: json['status'] as String,
      role: json['role'] as String,
      is_verified: json['is_verified'] as bool,
      is_active: json['is_active'] as bool,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UpdateUserArgumentsToJson(
        UpdateUserArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'status': instance.status,
      'role': instance.role,
      'is_verified': instance.is_verified,
      'is_active': instance.is_active,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
    };

AddUserOrganizationMapArguments _$AddUserOrganizationMapArgumentsFromJson(
        Map<String, dynamic> json) =>
    AddUserOrganizationMapArguments(
      user_organization_id: json['user_organization_id'] as String,
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
      organization_id: json['organization_id'] as String,
      organization_role: json['organization_role'] as String,
      is_active: json['is_active'] as bool,
      employee_id: json['employee_id'] as String,
    );

Map<String, dynamic> _$AddUserOrganizationMapArgumentsToJson(
        AddUserOrganizationMapArguments instance) =>
    <String, dynamic>{
      'user_organization_id': instance.user_organization_id,
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
      'organization_id': instance.organization_id,
      'organization_role': instance.organization_role,
      'is_active': instance.is_active,
      'employee_id': instance.employee_id,
    };

UpdateUserOrganizationMapArguments _$UpdateUserOrganizationMapArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateUserOrganizationMapArguments(
      user_organization_id: json['user_organization_id'] as String,
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
      organization_id: json['organization_id'] as String,
      organization_role: json['organization_role'] as String,
      is_active: json['is_active'] as bool,
      employee_id: json['employee_id'] as String,
    );

Map<String, dynamic> _$UpdateUserOrganizationMapArgumentsToJson(
        UpdateUserOrganizationMapArguments instance) =>
    <String, dynamic>{
      'user_organization_id': instance.user_organization_id,
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
      'organization_id': instance.organization_id,
      'organization_role': instance.organization_role,
      'is_active': instance.is_active,
      'employee_id': instance.employee_id,
    };

AddUserPreferenceArguments _$AddUserPreferenceArgumentsFromJson(
        Map<String, dynamic> json) =>
    AddUserPreferenceArguments(
      user_preference_id: json['user_preference_id'] as String,
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
      preference_id: json['preference_id'] as String,
      preference_value: json['preference_value'] as String,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$AddUserPreferenceArgumentsToJson(
        AddUserPreferenceArguments instance) =>
    <String, dynamic>{
      'user_preference_id': instance.user_preference_id,
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
      'preference_id': instance.preference_id,
      'preference_value': instance.preference_value,
      'is_active': instance.is_active,
    };

UpdateUserPreferenceArguments _$UpdateUserPreferenceArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateUserPreferenceArguments(
      user_preference_id: json['user_preference_id'] as String,
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
      sub_category: json['sub_category'] as String,
      is_base: json['is_base'] as bool,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$UpdateUserPreferenceArgumentsToJson(
        UpdateUserPreferenceArguments instance) =>
    <String, dynamic>{
      'user_preference_id': instance.user_preference_id,
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
      'sub_category': instance.sub_category,
      'is_base': instance.is_base,
      'is_active': instance.is_active,
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

GetUserLspByLspIdArguments _$GetUserLspByLspIdArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserLspByLspIdArguments(
      user_id: json['user_id'] as String,
      lsp_id: json['lsp_id'] as String,
    );

Map<String, dynamic> _$GetUserLspByLspIdArgumentsToJson(
        GetUserLspByLspIdArguments instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'lsp_id': instance.lsp_id,
    };

GetUserOrganizationsArguments _$GetUserOrganizationsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserOrganizationsArguments(
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$GetUserOrganizationsArgumentsToJson(
        GetUserOrganizationsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

GetUserOrgDetailsArguments _$GetUserOrgDetailsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserOrgDetailsArguments(
      userId: json['userId'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
    );

Map<String, dynamic> _$GetUserOrgDetailsArgumentsToJson(
        GetUserOrgDetailsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'user_lsp_id': instance.user_lsp_id,
    };

AllCatMainArguments _$AllCatMainArgumentsFromJson(Map<String, dynamic> json) =>
    AllCatMainArguments(
      lsp_ids: (json['lsp_ids'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      searchText: json['searchText'] as String?,
    );

Map<String, dynamic> _$AllCatMainArgumentsToJson(
        AllCatMainArguments instance) =>
    <String, dynamic>{
      'lsp_ids': instance.lsp_ids,
      'searchText': instance.searchText,
    };

AllSubCatMainArguments _$AllSubCatMainArgumentsFromJson(
        Map<String, dynamic> json) =>
    AllSubCatMainArguments(
      lsp_ids: (json['lsp_ids'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      searchText: json['searchText'] as String?,
    );

Map<String, dynamic> _$AllSubCatMainArgumentsToJson(
        AllSubCatMainArguments instance) =>
    <String, dynamic>{
      'lsp_ids': instance.lsp_ids,
      'searchText': instance.searchText,
    };

AllSubCatByCatIdArguments _$AllSubCatByCatIdArgumentsFromJson(
        Map<String, dynamic> json) =>
    AllSubCatByCatIdArguments(
      catId: json['catId'] as String?,
    );

Map<String, dynamic> _$AllSubCatByCatIdArgumentsToJson(
        AllSubCatByCatIdArguments instance) =>
    <String, dynamic>{
      'catId': instance.catId,
    };

GetUserPreferencesArguments _$GetUserPreferencesArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserPreferencesArguments(
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$GetUserPreferencesArgumentsToJson(
        GetUserPreferencesArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

GetUserPreferenceForLspArguments _$GetUserPreferenceForLspArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserPreferenceForLspArguments(
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
    );

Map<String, dynamic> _$GetUserPreferenceForLspArgumentsToJson(
        GetUserPreferenceForLspArguments instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
    };
