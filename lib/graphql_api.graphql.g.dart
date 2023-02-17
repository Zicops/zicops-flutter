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

GetLearningSpaceDetails$QueryRoot$LearningSpace
    _$GetLearningSpaceDetails$QueryRoot$LearningSpaceFromJson(
            Map<String, dynamic> json) =>
        GetLearningSpaceDetails$QueryRoot$LearningSpace()
          ..lspId = json['lsp_id'] as String?
          ..orgId = json['org_id'] as String
          ..ouId = json['ou_id'] as String
          ..name = json['name'] as String
          ..logoUrl = json['logo_url'] as String?
          ..profileUrl = json['profile_url'] as String?
          ..noUsers = json['no_users'] as int
          ..owners = (json['owners'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..isDefault = json['is_default'] as bool
          ..status = json['status'] as String
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?;

Map<String, dynamic> _$GetLearningSpaceDetails$QueryRoot$LearningSpaceToJson(
        GetLearningSpaceDetails$QueryRoot$LearningSpace instance) =>
    <String, dynamic>{
      'lsp_id': instance.lspId,
      'org_id': instance.orgId,
      'ou_id': instance.ouId,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'profile_url': instance.profileUrl,
      'no_users': instance.noUsers,
      'owners': instance.owners,
      'is_default': instance.isDefault,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

GetLearningSpaceDetails$QueryRoot _$GetLearningSpaceDetails$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetLearningSpaceDetails$QueryRoot()
      ..getLearningSpaceDetails =
          (json['getLearningSpaceDetails'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetLearningSpaceDetails$QueryRoot$LearningSpace.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetLearningSpaceDetails$QueryRootToJson(
        GetLearningSpaceDetails$QueryRoot instance) =>
    <String, dynamic>{
      'getLearningSpaceDetails':
          instance.getLearningSpaceDetails?.map((e) => e?.toJson()).toList(),
    };

GetOrganizations$QueryRoot$Organization
    _$GetOrganizations$QueryRoot$OrganizationFromJson(
            Map<String, dynamic> json) =>
        GetOrganizations$QueryRoot$Organization()
          ..orgId = json['org_id'] as String?
          ..name = json['name'] as String
          ..logoUrl = json['logo_url'] as String?
          ..industry = json['industry'] as String
          ..type = json['type'] as String
          ..subdomain = json['subdomain'] as String
          ..employeeCount = json['employee_count'] as int
          ..website = json['website'] as String
          ..linkedinUrl = json['linkedin_url'] as String?
          ..facebookUrl = json['facebook_url'] as String?
          ..twitterUrl = json['twitter_url'] as String?
          ..status = json['status'] as String
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?;

Map<String, dynamic> _$GetOrganizations$QueryRoot$OrganizationToJson(
        GetOrganizations$QueryRoot$Organization instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'industry': instance.industry,
      'type': instance.type,
      'subdomain': instance.subdomain,
      'employee_count': instance.employeeCount,
      'website': instance.website,
      'linkedin_url': instance.linkedinUrl,
      'facebook_url': instance.facebookUrl,
      'twitter_url': instance.twitterUrl,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

GetOrganizations$QueryRoot _$GetOrganizations$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetOrganizations$QueryRoot()
      ..getOrganizations = (json['getOrganizations'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetOrganizations$QueryRoot$Organization.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetOrganizations$QueryRootToJson(
        GetOrganizations$QueryRoot instance) =>
    <String, dynamic>{
      'getOrganizations':
          instance.getOrganizations?.map((e) => e?.toJson()).toList(),
    };

GetUserDetails$QueryRoot$User _$GetUserDetails$QueryRoot$UserFromJson(
        Map<String, dynamic> json) =>
    GetUserDetails$QueryRoot$User()
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

Map<String, dynamic> _$GetUserDetails$QueryRoot$UserToJson(
        GetUserDetails$QueryRoot$User instance) =>
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

GetUserDetails$QueryRoot _$GetUserDetails$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserDetails$QueryRoot()
      ..getUserDetails = (json['getUserDetails'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetUserDetails$QueryRoot$User.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUserDetails$QueryRootToJson(
        GetUserDetails$QueryRoot instance) =>
    <String, dynamic>{
      'getUserDetails':
          instance.getUserDetails?.map((e) => e?.toJson()).toList(),
    };

GetUserLspRoles$QueryRoot$UserRole _$GetUserLspRoles$QueryRoot$UserRoleFromJson(
        Map<String, dynamic> json) =>
    GetUserLspRoles$QueryRoot$UserRole()
      ..userRoleId = json['user_role_id'] as String?
      ..userId = json['user_id'] as String
      ..userLspId = json['user_lsp_id'] as String
      ..role = json['role'] as String
      ..isActive = json['is_active'] as bool
      ..createdBy = json['created_by'] as String?
      ..updatedBy = json['updated_by'] as String?
      ..createdAt = json['created_at'] as String
      ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$GetUserLspRoles$QueryRoot$UserRoleToJson(
        GetUserLspRoles$QueryRoot$UserRole instance) =>
    <String, dynamic>{
      'user_role_id': instance.userRoleId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'role': instance.role,
      'is_active': instance.isActive,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserLspRoles$QueryRoot _$GetUserLspRoles$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserLspRoles$QueryRoot()
      ..getUserLspRoles = (json['getUserLspRoles'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetUserLspRoles$QueryRoot$UserRole.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetUserLspRoles$QueryRootToJson(
        GetUserLspRoles$QueryRoot instance) =>
    <String, dynamic>{
      'getUserLspRoles':
          instance.getUserLspRoles?.map((e) => e?.toJson()).toList(),
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

LatestCourses$QueryRoot$PaginatedCourse$Course
    _$LatestCourses$QueryRoot$PaginatedCourse$CourseFromJson(
            Map<String, dynamic> json) =>
        LatestCourses$QueryRoot$PaginatedCourse$Course()
          ..id = json['id'] as String?
          ..name = json['name'] as String?
          ..lspId = json['lspId'] as String?
          ..publisher = json['publisher'] as String?
          ..description = json['description'] as String?
          ..summary = json['summary'] as String?
          ..instructor = json['instructor'] as String?
          ..image = json['image'] as String?
          ..previewVideo = json['previewVideo'] as String?
          ..tileImage = json['tileImage'] as String?
          ..owner = json['owner'] as String?
          ..duration = json['duration'] as int?
          ..expertiseLevel = json['expertise_level'] as String?
          ..language = (json['language'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..benefits = (json['benefits'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..outcomes = (json['outcomes'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..createdAt = json['created_at'] as String?
          ..updatedAt = json['updated_at'] as String?
          ..type = json['type'] as String?
          ..prequisites = (json['prequisites'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..goodFor = (json['goodFor'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..mustFor = (json['mustFor'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..relatedSkills = (json['related_skills'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..publishDate = json['publish_date'] as String?
          ..expiryDate = json['expiry_date'] as String?
          ..expectedCompletion = json['expected_completion'] as String?
          ..qaRequired = json['qa_required'] as bool?
          ..approvers = (json['approvers'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList()
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..status = $enumDecodeNullable(_$StatusEnumMap, json['status'],
              unknownValue: Status.artemisUnknown)
          ..isDisplay = json['is_display'] as bool?
          ..category = json['category'] as String?
          ..subCategory = json['sub_category'] as String?
          ..subCategories = (json['sub_categories'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : CourseFragmentMixin$SubCategories.fromJson(
                      e as Map<String, dynamic>))
              .toList()
          ..isActive = json['is_active'] as bool?;

Map<String, dynamic> _$LatestCourses$QueryRoot$PaginatedCourse$CourseToJson(
        LatestCourses$QueryRoot$PaginatedCourse$Course instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lspId': instance.lspId,
      'publisher': instance.publisher,
      'description': instance.description,
      'summary': instance.summary,
      'instructor': instance.instructor,
      'image': instance.image,
      'previewVideo': instance.previewVideo,
      'tileImage': instance.tileImage,
      'owner': instance.owner,
      'duration': instance.duration,
      'expertise_level': instance.expertiseLevel,
      'language': instance.language,
      'benefits': instance.benefits,
      'outcomes': instance.outcomes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'prequisites': instance.prequisites,
      'goodFor': instance.goodFor,
      'mustFor': instance.mustFor,
      'related_skills': instance.relatedSkills,
      'publish_date': instance.publishDate,
      'expiry_date': instance.expiryDate,
      'expected_completion': instance.expectedCompletion,
      'qa_required': instance.qaRequired,
      'approvers': instance.approvers,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'status': _$StatusEnumMap[instance.status],
      'is_display': instance.isDisplay,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'sub_categories':
          instance.subCategories?.map((e) => e?.toJson()).toList(),
      'is_active': instance.isActive,
    };

const _$StatusEnumMap = {
  Status.saved: 'SAVED',
  Status.approvalPending: 'APPROVAL_PENDING',
  Status.onHold: 'ON_HOLD',
  Status.approved: 'APPROVED',
  Status.published: 'PUBLISHED',
  Status.rejected: 'REJECTED',
  Status.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

LatestCourses$QueryRoot$PaginatedCourse
    _$LatestCourses$QueryRoot$PaginatedCourseFromJson(
            Map<String, dynamic> json) =>
        LatestCourses$QueryRoot$PaginatedCourse()
          ..courses = (json['courses'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LatestCourses$QueryRoot$PaginatedCourse$Course.fromJson(
                      e as Map<String, dynamic>))
              .toList()
          ..pageCursor = json['pageCursor'] as String?
          ..direction = json['direction'] as String?
          ..pageSize = json['pageSize'] as int?;

Map<String, dynamic> _$LatestCourses$QueryRoot$PaginatedCourseToJson(
        LatestCourses$QueryRoot$PaginatedCourse instance) =>
    <String, dynamic>{
      'courses': instance.courses?.map((e) => e?.toJson()).toList(),
      'pageCursor': instance.pageCursor,
      'direction': instance.direction,
      'pageSize': instance.pageSize,
    };

LatestCourses$QueryRoot _$LatestCourses$QueryRootFromJson(
        Map<String, dynamic> json) =>
    LatestCourses$QueryRoot()
      ..latestCourses = json['latestCourses'] == null
          ? null
          : LatestCourses$QueryRoot$PaginatedCourse.fromJson(
              json['latestCourses'] as Map<String, dynamic>);

Map<String, dynamic> _$LatestCourses$QueryRootToJson(
        LatestCourses$QueryRoot instance) =>
    <String, dynamic>{
      'latestCourses': instance.latestCourses?.toJson(),
    };

CourseFragmentMixin$SubCategories _$CourseFragmentMixin$SubCategoriesFromJson(
        Map<String, dynamic> json) =>
    CourseFragmentMixin$SubCategories()
      ..name = json['name'] as String?
      ..rank = json['rank'] as int?;

Map<String, dynamic> _$CourseFragmentMixin$SubCategoriesToJson(
        CourseFragmentMixin$SubCategories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rank': instance.rank,
    };

CoursesFilters _$CoursesFiltersFromJson(Map<String, dynamic> json) =>
    CoursesFilters(
      lspId: json['LspId'] as String?,
      category: json['Category'] as String?,
      subCategory: json['SubCategory'] as String?,
      language: json['Language'] as String?,
      durationMin: json['DurationMin'] as int?,
      durationMax: json['DurationMax'] as int?,
      type: json['Type'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$CoursesFiltersToJson(CoursesFilters instance) =>
    <String, dynamic>{
      'LspId': instance.lspId,
      'Category': instance.category,
      'SubCategory': instance.subCategory,
      'Language': instance.language,
      'DurationMin': instance.durationMin,
      'DurationMax': instance.durationMax,
      'Type': instance.type,
      'SearchText': instance.searchText,
    };

GetCourseData$QueryRoot$Module _$GetCourseData$QueryRoot$ModuleFromJson(
        Map<String, dynamic> json) =>
    GetCourseData$QueryRoot$Module()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..isChapter = json['isChapter'] as bool?
      ..description = json['description'] as String?
      ..courseId = json['courseId'] as String?
      ..owner = json['owner'] as String?
      ..duration = json['duration'] as int?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..level = json['level'] as String?
      ..sequence = json['sequence'] as int?
      ..setGlobal = json['setGlobal'] as bool?;

Map<String, dynamic> _$GetCourseData$QueryRoot$ModuleToJson(
        GetCourseData$QueryRoot$Module instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isChapter': instance.isChapter,
      'description': instance.description,
      'courseId': instance.courseId,
      'owner': instance.owner,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'level': instance.level,
      'sequence': instance.sequence,
      'setGlobal': instance.setGlobal,
    };

GetCourseData$QueryRoot$Chapter _$GetCourseData$QueryRoot$ChapterFromJson(
        Map<String, dynamic> json) =>
    GetCourseData$QueryRoot$Chapter()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..moduleId = json['moduleId'] as String?
      ..courseId = json['courseId'] as String?
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..sequence = json['sequence'] as int?;

Map<String, dynamic> _$GetCourseData$QueryRoot$ChapterToJson(
        GetCourseData$QueryRoot$Chapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'courseId': instance.courseId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'sequence': instance.sequence,
    };

GetCourseData$QueryRoot _$GetCourseData$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetCourseData$QueryRoot()
      ..getCourseModules = (json['getCourseModules'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetCourseData$QueryRoot$Module.fromJson(
                  e as Map<String, dynamic>))
          .toList()
      ..getCourseChapters = (json['getCourseChapters'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetCourseData$QueryRoot$Chapter.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCourseData$QueryRootToJson(
        GetCourseData$QueryRoot instance) =>
    <String, dynamic>{
      'getCourseModules':
          instance.getCourseModules?.map((e) => e?.toJson()).toList(),
      'getCourseChapters':
          instance.getCourseChapters?.map((e) => e?.toJson()).toList(),
    };

GetModuleContent$QueryRoot$TopicContent$SubtitleUrl
    _$GetModuleContent$QueryRoot$TopicContent$SubtitleUrlFromJson(
            Map<String, dynamic> json) =>
        GetModuleContent$QueryRoot$TopicContent$SubtitleUrl()
          ..url = json['url'] as String?
          ..language = json['language'] as String?;

Map<String, dynamic>
    _$GetModuleContent$QueryRoot$TopicContent$SubtitleUrlToJson(
            GetModuleContent$QueryRoot$TopicContent$SubtitleUrl instance) =>
        <String, dynamic>{
          'url': instance.url,
          'language': instance.language,
        };

GetModuleContent$QueryRoot$TopicContent
    _$GetModuleContent$QueryRoot$TopicContentFromJson(
            Map<String, dynamic> json) =>
        GetModuleContent$QueryRoot$TopicContent()
          ..id = json['id'] as String?
          ..language = json['language'] as String?
          ..topicId = json['topicId'] as String?
          ..courseId = json['courseId'] as String?
          ..startTime = json['startTime'] as int?
          ..duration = json['duration'] as int?
          ..skipIntroDuration = json['skipIntroDuration'] as int?
          ..nextShowTime = json['nextShowTime'] as int?
          ..fromEndTime = json['fromEndTime'] as int?
          ..createdAt = json['created_at'] as String?
          ..updatedAt = json['updated_at'] as String?
          ..type = json['type'] as String?
          ..contentUrl = json['contentUrl'] as String?
          ..subtitleUrl = (json['subtitleUrl'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetModuleContent$QueryRoot$TopicContent$SubtitleUrl
                      .fromJson(e as Map<String, dynamic>))
              .toList()
          ..isDefault = json['is_default'] as bool?;

Map<String, dynamic> _$GetModuleContent$QueryRoot$TopicContentToJson(
        GetModuleContent$QueryRoot$TopicContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'topicId': instance.topicId,
      'courseId': instance.courseId,
      'startTime': instance.startTime,
      'duration': instance.duration,
      'skipIntroDuration': instance.skipIntroDuration,
      'nextShowTime': instance.nextShowTime,
      'fromEndTime': instance.fromEndTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'contentUrl': instance.contentUrl,
      'subtitleUrl': instance.subtitleUrl?.map((e) => e?.toJson()).toList(),
      'is_default': instance.isDefault,
    };

GetModuleContent$QueryRoot _$GetModuleContent$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetModuleContent$QueryRoot()
      ..getTopicContentByModuleId =
          (json['getTopicContentByModuleId'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetModuleContent$QueryRoot$TopicContent.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetModuleContent$QueryRootToJson(
        GetModuleContent$QueryRoot instance) =>
    <String, dynamic>{
      'getTopicContentByModuleId':
          instance.getTopicContentByModuleId?.map((e) => e?.toJson()).toList(),
    };

GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse
    _$GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourseFromJson(
            Map<String, dynamic> json) =>
        GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse()
          ..userCourseId = json['user_course_id'] as String?
          ..userId = json['user_id'] as String
          ..userLspId = json['user_lsp_id'] as String
          ..lspId = json['lsp_id'] as String?
          ..courseId = json['course_id'] as String
          ..courseType = json['course_type'] as String
          ..addedBy = json['added_by'] as String
          ..isMandatory = json['is_mandatory'] as bool
          ..endDate = json['end_date'] as String?
          ..courseStatus = json['course_status'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String,
    dynamic> _$GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourseToJson(
        GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse instance) =>
    <String, dynamic>{
      'user_course_id': instance.userCourseId,
      'user_id': instance.userId,
      'user_lsp_id': instance.userLspId,
      'lsp_id': instance.lspId,
      'course_id': instance.courseId,
      'course_type': instance.courseType,
      'added_by': instance.addedBy,
      'is_mandatory': instance.isMandatory,
      'end_date': instance.endDate,
      'course_status': instance.courseStatus,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserCourseMaps$QueryRoot$PaginatedCourseMaps
    _$GetUserCourseMaps$QueryRoot$PaginatedCourseMapsFromJson(
            Map<String, dynamic> json) =>
        GetUserCourseMaps$QueryRoot$PaginatedCourseMaps()
          ..userCourses = (json['user_courses'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse
                      .fromJson(e as Map<String, dynamic>))
              .toList()
          ..pageCursor = json['pageCursor'] as String?
          ..direction = json['direction'] as String?
          ..pageSize = json['pageSize'] as int?;

Map<String, dynamic> _$GetUserCourseMaps$QueryRoot$PaginatedCourseMapsToJson(
        GetUserCourseMaps$QueryRoot$PaginatedCourseMaps instance) =>
    <String, dynamic>{
      'user_courses': instance.userCourses?.map((e) => e?.toJson()).toList(),
      'pageCursor': instance.pageCursor,
      'direction': instance.direction,
      'pageSize': instance.pageSize,
    };

GetUserCourseMaps$QueryRoot _$GetUserCourseMaps$QueryRootFromJson(
        Map<String, dynamic> json) =>
    GetUserCourseMaps$QueryRoot()
      ..getUserCourseMaps = json['getUserCourseMaps'] == null
          ? null
          : GetUserCourseMaps$QueryRoot$PaginatedCourseMaps.fromJson(
              json['getUserCourseMaps'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserCourseMaps$QueryRootToJson(
        GetUserCourseMaps$QueryRoot instance) =>
    <String, dynamic>{
      'getUserCourseMaps': instance.getUserCourseMaps?.toJson(),
    };

CourseMapFilters _$CourseMapFiltersFromJson(Map<String, dynamic> json) =>
    CourseMapFilters(
      lspId:
          (json['lsp_id'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      isMandatory: json['is_mandatory'] as bool?,
      status: json['status'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CourseMapFiltersToJson(CourseMapFilters instance) =>
    <String, dynamic>{
      'lsp_id': instance.lspId,
      'is_mandatory': instance.isMandatory,
      'status': instance.status,
      'type': instance.type,
    };

GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress
    _$GetUserCourseProgressByMapId$QueryRoot$UserCourseProgressFromJson(
            Map<String, dynamic> json) =>
        GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress()
          ..userCpId = json['user_cp_id'] as String?
          ..userId = json['user_id'] as String
          ..userCourseId = json['user_course_id'] as String
          ..topicId = json['topic_id'] as String
          ..topicType = json['topic_type'] as String
          ..status = json['status'] as String
          ..videoProgress = json['video_progress'] as String
          ..timeStamp = json['time_stamp'] as String
          ..createdBy = json['created_by'] as String?
          ..updatedBy = json['updated_by'] as String?
          ..createdAt = json['created_at'] as String
          ..updatedAt = json['updated_at'] as String;

Map<String,
    dynamic> _$GetUserCourseProgressByMapId$QueryRoot$UserCourseProgressToJson(
        GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress instance) =>
    <String, dynamic>{
      'user_cp_id': instance.userCpId,
      'user_id': instance.userId,
      'user_course_id': instance.userCourseId,
      'topic_id': instance.topicId,
      'topic_type': instance.topicType,
      'status': instance.status,
      'video_progress': instance.videoProgress,
      'time_stamp': instance.timeStamp,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

GetUserCourseProgressByMapId$QueryRoot
    _$GetUserCourseProgressByMapId$QueryRootFromJson(
            Map<String, dynamic> json) =>
        GetUserCourseProgressByMapId$QueryRoot()
          ..getUserCourseProgressByMapId = (json['getUserCourseProgressByMapId']
                  as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetUserCourseProgressByMapId$QueryRootToJson(
        GetUserCourseProgressByMapId$QueryRoot instance) =>
    <String, dynamic>{
      'getUserCourseProgressByMapId': instance.getUserCourseProgressByMapId
          ?.map((e) => e?.toJson())
          .toList(),
    };

GetCourse$QueryRoot$Course _$GetCourse$QueryRoot$CourseFromJson(
        Map<String, dynamic> json) =>
    GetCourse$QueryRoot$Course()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..lspId = json['lspId'] as String?
      ..publisher = json['publisher'] as String?
      ..description = json['description'] as String?
      ..summary = json['summary'] as String?
      ..instructor = json['instructor'] as String?
      ..image = json['image'] as String?
      ..previewVideo = json['previewVideo'] as String?
      ..tileImage = json['tileImage'] as String?
      ..owner = json['owner'] as String?
      ..duration = json['duration'] as int?
      ..expertiseLevel = json['expertise_level'] as String?
      ..language = (json['language'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..benefits = (json['benefits'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..outcomes = (json['outcomes'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updated_at'] as String?
      ..type = json['type'] as String?
      ..prequisites = (json['prequisites'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..goodFor =
          (json['goodFor'] as List<dynamic>?)?.map((e) => e as String?).toList()
      ..mustFor =
          (json['mustFor'] as List<dynamic>?)?.map((e) => e as String?).toList()
      ..relatedSkills = (json['related_skills'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..publishDate = json['publish_date'] as String?
      ..expiryDate = json['expiry_date'] as String?
      ..expectedCompletion = json['expected_completion'] as String?
      ..qaRequired = json['qa_required'] as bool?
      ..approvers = (json['approvers'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..createdBy = json['created_by'] as String?
      ..updatedBy = json['updated_by'] as String?
      ..status = $enumDecodeNullable(_$StatusEnumMap, json['status'],
          unknownValue: Status.artemisUnknown)
      ..isDisplay = json['is_display'] as bool?
      ..category = json['category'] as String?
      ..subCategory = json['sub_category'] as String?
      ..subCategories = (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CourseFragmentMixin$SubCategories.fromJson(
                  e as Map<String, dynamic>))
          .toList()
      ..isActive = json['is_active'] as bool?;

Map<String, dynamic> _$GetCourse$QueryRoot$CourseToJson(
        GetCourse$QueryRoot$Course instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lspId': instance.lspId,
      'publisher': instance.publisher,
      'description': instance.description,
      'summary': instance.summary,
      'instructor': instance.instructor,
      'image': instance.image,
      'previewVideo': instance.previewVideo,
      'tileImage': instance.tileImage,
      'owner': instance.owner,
      'duration': instance.duration,
      'expertise_level': instance.expertiseLevel,
      'language': instance.language,
      'benefits': instance.benefits,
      'outcomes': instance.outcomes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'prequisites': instance.prequisites,
      'goodFor': instance.goodFor,
      'mustFor': instance.mustFor,
      'related_skills': instance.relatedSkills,
      'publish_date': instance.publishDate,
      'expiry_date': instance.expiryDate,
      'expected_completion': instance.expectedCompletion,
      'qa_required': instance.qaRequired,
      'approvers': instance.approvers,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'status': _$StatusEnumMap[instance.status],
      'is_display': instance.isDisplay,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'sub_categories':
          instance.subCategories?.map((e) => e?.toJson()).toList(),
      'is_active': instance.isActive,
    };

GetCourse$QueryRoot _$GetCourse$QueryRootFromJson(Map<String, dynamic> json) =>
    GetCourse$QueryRoot()
      ..getCourse = (json['getCourse'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetCourse$QueryRoot$Course.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCourse$QueryRootToJson(
        GetCourse$QueryRoot instance) =>
    <String, dynamic>{
      'getCourse': instance.getCourse?.map((e) => e?.toJson()).toList(),
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
      Photo: fromGraphQLUploadNullableToDartMultipartFileNullable(
          json['Photo'] as MultipartFile?),
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
      'Photo':
          fromDartMultipartFileNullableToGraphQLUploadNullable(instance.Photo),
    };

AddUserOrganizationMapArguments _$AddUserOrganizationMapArgumentsFromJson(
        Map<String, dynamic> json) =>
    AddUserOrganizationMapArguments(
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
      user_id: json['user_id'] as String,
      user_lsp_id: json['user_lsp_id'] as String,
      sub_category: json['sub_category'] as String,
      is_base: json['is_base'] as bool,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$AddUserPreferenceArgumentsToJson(
        AddUserPreferenceArguments instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_lsp_id': instance.user_lsp_id,
      'sub_category': instance.sub_category,
      'is_base': instance.is_base,
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

GetLearningSpaceDetailsArguments _$GetLearningSpaceDetailsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetLearningSpaceDetailsArguments(
      lsp_ids: (json['lsp_ids'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$GetLearningSpaceDetailsArgumentsToJson(
        GetLearningSpaceDetailsArguments instance) =>
    <String, dynamic>{
      'lsp_ids': instance.lsp_ids,
    };

GetOrganizationsArguments _$GetOrganizationsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetOrganizationsArguments(
      org_ids: (json['org_ids'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$GetOrganizationsArgumentsToJson(
        GetOrganizationsArguments instance) =>
    <String, dynamic>{
      'org_ids': instance.org_ids,
    };

GetUserDetailsArguments _$GetUserDetailsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserDetailsArguments(
      userId:
          (json['userId'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$GetUserDetailsArgumentsToJson(
        GetUserDetailsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

GetUserLspRolesArguments _$GetUserLspRolesArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserLspRolesArguments(
      user_id: json['user_id'] as String,
      user_lsp_ids: (json['user_lsp_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetUserLspRolesArgumentsToJson(
        GetUserLspRolesArguments instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_lsp_ids': instance.user_lsp_ids,
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

LatestCoursesArguments _$LatestCoursesArgumentsFromJson(
        Map<String, dynamic> json) =>
    LatestCoursesArguments(
      publishTime: json['publishTime'] as int?,
      pageCursor: json['pageCursor'] as String?,
      Direction: json['Direction'] as String?,
      pageSize: json['pageSize'] as int?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status'],
          unknownValue: Status.artemisUnknown),
      filters: json['filters'] == null
          ? null
          : CoursesFilters.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LatestCoursesArgumentsToJson(
        LatestCoursesArguments instance) =>
    <String, dynamic>{
      'publishTime': instance.publishTime,
      'pageCursor': instance.pageCursor,
      'Direction': instance.Direction,
      'pageSize': instance.pageSize,
      'status': _$StatusEnumMap[instance.status],
      'filters': instance.filters?.toJson(),
    };

GetCourseDataArguments _$GetCourseDataArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetCourseDataArguments(
      course_id: json['course_id'] as String?,
    );

Map<String, dynamic> _$GetCourseDataArgumentsToJson(
        GetCourseDataArguments instance) =>
    <String, dynamic>{
      'course_id': instance.course_id,
    };

GetModuleContentArguments _$GetModuleContentArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetModuleContentArguments(
      module_id: json['module_id'] as String?,
    );

Map<String, dynamic> _$GetModuleContentArgumentsToJson(
        GetModuleContentArguments instance) =>
    <String, dynamic>{
      'module_id': instance.module_id,
    };

GetUserCourseMapsArguments _$GetUserCourseMapsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserCourseMapsArguments(
      user_id: json['user_id'] as String,
      publish_time: json['publish_time'] as int?,
      pageCursor: json['pageCursor'] as String?,
      pageSize: json['pageSize'] as int?,
      filters: json['filters'] == null
          ? null
          : CourseMapFilters.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserCourseMapsArgumentsToJson(
        GetUserCourseMapsArguments instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'publish_time': instance.publish_time,
      'pageCursor': instance.pageCursor,
      'pageSize': instance.pageSize,
      'filters': instance.filters?.toJson(),
    };

GetUserCourseProgressByMapIdArguments
    _$GetUserCourseProgressByMapIdArgumentsFromJson(
            Map<String, dynamic> json) =>
        GetUserCourseProgressByMapIdArguments(
          userId: json['userId'] as String,
          userCourseId: (json['userCourseId'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$GetUserCourseProgressByMapIdArgumentsToJson(
        GetUserCourseProgressByMapIdArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userCourseId': instance.userCourseId,
    };

GetCourseArguments _$GetCourseArgumentsFromJson(Map<String, dynamic> json) =>
    GetCourseArguments(
      course_id: (json['course_id'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$GetCourseArgumentsToJson(GetCourseArguments instance) =>
    <String, dynamic>{
      'course_id': instance.course_id,
    };
