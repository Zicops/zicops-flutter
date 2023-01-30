// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:http/http.dart';
import 'package:zicops/artemis_upload.dart';
part 'graphql_api.graphql.g.dart';

mixin UserLspFragmentMixin {
  @JsonKey(name: 'user_lsp_id')
  String? userLspId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'lsp_id')
  late String lspId;
  late String status;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
}
mixin LearningSpaceFragmentMixin {
  @JsonKey(name: 'lsp_id')
  String? lspId;
  @JsonKey(name: 'org_id')
  late String orgId;
  @JsonKey(name: 'ou_id')
  late String ouId;
  late String name;
  @JsonKey(name: 'logo_url')
  String? logoUrl;
  @JsonKey(name: 'profile_url')
  String? profileUrl;
  @JsonKey(name: 'no_users')
  late int noUsers;
  List<String?>? owners;
  @JsonKey(name: 'is_default')
  late bool isDefault;
  late String status;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
}
mixin OrganizationFragmentMixin {
  @JsonKey(name: 'org_id')
  String? orgId;
  late String name;
  @JsonKey(name: 'logo_url')
  String? logoUrl;
  late String industry;
  late String type;
  late String subdomain;
  @JsonKey(name: 'employee_count')
  late int employeeCount;
  late String website;
  @JsonKey(name: 'linkedin_url')
  String? linkedinUrl;
  @JsonKey(name: 'facebook_url')
  String? facebookUrl;
  @JsonKey(name: 'twitter_url')
  String? twitterUrl;
  late String status;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
}
mixin UserFragmentMixin {
  String? id;
  @JsonKey(name: 'first_name')
  late String firstName;
  @JsonKey(name: 'last_name')
  late String lastName;
  late String status;
  late String role;
  @JsonKey(name: 'is_verified')
  late bool isVerified;
  @JsonKey(name: 'is_active')
  late bool isActive;
  late String gender;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
  late String email;
  late String phone;
  @JsonKey(name: 'photo_url')
  String? photoUrl;
}
mixin UserRoleFragmentMixin {
  @JsonKey(name: 'user_role_id')
  String? userRoleId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'user_lsp_id')
  late String userLspId;
  late String role;
  @JsonKey(name: 'is_active')
  late bool isActive;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
}
mixin UserOrganizationFragmentMixin {
  @JsonKey(name: 'user_organization_id')
  String? userOrganizationId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'user_lsp_id')
  late String userLspId;
  @JsonKey(name: 'organization_id')
  late String organizationId;
  @JsonKey(name: 'organization_role')
  late String organizationRole;
  @JsonKey(name: 'is_active')
  late bool isActive;
  @JsonKey(name: 'employee_id')
  late String employeeId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
}
mixin AllCatMainFragmentMixin {
  String? id;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'ImageUrl')
  String? imageUrl;
  @JsonKey(name: 'Code')
  String? code;
  @JsonKey(name: 'CreatedAt')
  String? createdAt;
  @JsonKey(name: 'UpdatedAt')
  String? updatedAt;
  @JsonKey(name: 'CreatedBy')
  String? createdBy;
  @JsonKey(name: 'UpdatedBy')
  String? updatedBy;
  @JsonKey(name: 'IsActive')
  bool? isActive;
}
mixin AllSubCatMainFragmentMixin {
  String? id;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'ImageUrl')
  String? imageUrl;
  @JsonKey(name: 'Code')
  String? code;
  @JsonKey(name: 'CatId')
  String? catId;
  @JsonKey(name: 'CreatedAt')
  String? createdAt;
  @JsonKey(name: 'UpdatedAt')
  String? updatedAt;
  @JsonKey(name: 'CreatedBy')
  String? createdBy;
  @JsonKey(name: 'UpdatedBy')
  String? updatedBy;
  @JsonKey(name: 'IsActive')
  bool? isActive;
}
mixin UserPreferenceFragmentMixin {
  @JsonKey(name: 'user_preference_id')
  String? userPreferenceId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'user_lsp_id')
  late String userLspId;
  @JsonKey(name: 'sub_category')
  late String subCategory;
  @JsonKey(name: 'is_base')
  late bool isBase;
  @JsonKey(name: 'is_active')
  late bool isActive;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
}
mixin CourseFragmentMixin {
  String? id;
  String? name;
  String? lspId;
  String? publisher;
  String? description;
  String? summary;
  String? instructor;
  String? image;
  String? previewVideo;
  String? tileImage;
  String? owner;
  int? duration;
  @JsonKey(name: 'expertise_level')
  String? expertiseLevel;
  List<String?>? language;
  List<String?>? benefits;
  List<String?>? outcomes;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  String? type;
  List<String?>? prequisites;
  List<String?>? goodFor;
  List<String?>? mustFor;
  @JsonKey(name: 'related_skills')
  List<String?>? relatedSkills;
  @JsonKey(name: 'publish_date')
  String? publishDate;
  @JsonKey(name: 'expiry_date')
  String? expiryDate;
  @JsonKey(name: 'expected_completion')
  String? expectedCompletion;
  @JsonKey(name: 'qa_required')
  bool? qaRequired;
  List<String?>? approvers;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(unknownEnumValue: Status.artemisUnknown)
  Status? status;
  @JsonKey(name: 'is_display')
  bool? isDisplay;
  String? category;
  @JsonKey(name: 'sub_category')
  String? subCategory;
  @JsonKey(name: 'sub_categories')
  List<CourseFragmentMixin$SubCategories?>? subCategories;
  @JsonKey(name: 'is_active')
  bool? isActive;
}
mixin UserCourseFragmentMixin {
  @JsonKey(name: 'user_course_id')
  String? userCourseId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'user_lsp_id')
  late String userLspId;
  @JsonKey(name: 'lsp_id')
  String? lspId;
  @JsonKey(name: 'course_id')
  late String courseId;
  @JsonKey(name: 'course_type')
  late String courseType;
  @JsonKey(name: 'added_by')
  late String addedBy;
  @JsonKey(name: 'is_mandatory')
  late bool isMandatory;
  @JsonKey(name: 'end_date')
  String? endDate;
  @JsonKey(name: 'course_status')
  late String courseStatus;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
}
mixin UserCourseProgressFragmentMixin {
  @JsonKey(name: 'user_cp_id')
  String? userCpId;
  @JsonKey(name: 'user_id')
  late String userId;
  @JsonKey(name: 'user_course_id')
  late String userCourseId;
  @JsonKey(name: 'topic_id')
  late String topicId;
  @JsonKey(name: 'topic_type')
  late String topicType;
  late String status;
  @JsonKey(name: 'video_progress')
  late String videoProgress;
  @JsonKey(name: 'time_stamp')
  late String timeStamp;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'created_at')
  late String createdAt;
  @JsonKey(name: 'updated_at')
  late String updatedAt;
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot$User extends JsonSerializable
    with EquatableMixin {
  UpdateUser$MutationRoot$User();

  factory UpdateUser$MutationRoot$User.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRoot$UserFromJson(json);

  String? id;

  @JsonKey(name: 'first_name')
  late String firstName;

  @JsonKey(name: 'last_name')
  late String lastName;

  late String status;

  late String role;

  @JsonKey(name: 'is_verified')
  late bool isVerified;

  @JsonKey(name: 'is_active')
  late bool isActive;

  late String gender;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'updated_by')
  String? updatedBy;

  @JsonKey(name: 'created_at')
  late String createdAt;

  @JsonKey(name: 'updated_at')
  late String updatedAt;

  late String email;

  late String phone;

  @JsonKey(name: 'photo_url')
  String? photoUrl;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        status,
        role,
        isVerified,
        isActive,
        gender,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        email,
        phone,
        photoUrl
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot extends JsonSerializable with EquatableMixin {
  UpdateUser$MutationRoot();

  factory UpdateUser$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRootFromJson(json);

  UpdateUser$MutationRoot$User? updateUser;

  @override
  List<Object?> get props => [updateUser];
  @override
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddUserOrganizationMap$MutationRoot$UserOrganizationMap
    extends JsonSerializable with EquatableMixin {
  AddUserOrganizationMap$MutationRoot$UserOrganizationMap();

  factory AddUserOrganizationMap$MutationRoot$UserOrganizationMap.fromJson(
          Map<String, dynamic> json) =>
      _$AddUserOrganizationMap$MutationRoot$UserOrganizationMapFromJson(json);

  @JsonKey(name: 'user_organization_id')
  String? userOrganizationId;

  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey(name: 'user_lsp_id')
  late String userLspId;

  @JsonKey(name: 'organization_id')
  late String organizationId;

  @JsonKey(name: 'organization_role')
  late String organizationRole;

  @JsonKey(name: 'is_active')
  late bool isActive;

  @JsonKey(name: 'employee_id')
  late String employeeId;

  @override
  List<Object?> get props => [
        userOrganizationId,
        userId,
        userLspId,
        organizationId,
        organizationRole,
        isActive,
        employeeId
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$AddUserOrganizationMap$MutationRoot$UserOrganizationMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddUserOrganizationMap$MutationRoot extends JsonSerializable
    with EquatableMixin {
  AddUserOrganizationMap$MutationRoot();

  factory AddUserOrganizationMap$MutationRoot.fromJson(
          Map<String, dynamic> json) =>
      _$AddUserOrganizationMap$MutationRootFromJson(json);

  AddUserOrganizationMap$MutationRoot$UserOrganizationMap?
      addUserOrganizationMap;

  @override
  List<Object?> get props => [addUserOrganizationMap];
  @override
  Map<String, dynamic> toJson() =>
      _$AddUserOrganizationMap$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap
    extends JsonSerializable with EquatableMixin {
  UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap();

  factory UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserOrganizationMap$MutationRoot$UserOrganizationMapFromJson(
          json);

  @JsonKey(name: 'user_organization_id')
  String? userOrganizationId;

  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey(name: 'user_lsp_id')
  late String userLspId;

  @JsonKey(name: 'organization_id')
  late String organizationId;

  @JsonKey(name: 'organization_role')
  late String organizationRole;

  @JsonKey(name: 'is_active')
  late bool isActive;

  @JsonKey(name: 'employee_id')
  late String employeeId;

  @override
  List<Object?> get props => [
        userOrganizationId,
        userId,
        userLspId,
        organizationId,
        organizationRole,
        isActive,
        employeeId
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserOrganizationMap$MutationRoot$UserOrganizationMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserOrganizationMap$MutationRoot extends JsonSerializable
    with EquatableMixin {
  UpdateUserOrganizationMap$MutationRoot();

  factory UpdateUserOrganizationMap$MutationRoot.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserOrganizationMap$MutationRootFromJson(json);

  UpdateUserOrganizationMap$MutationRoot$UserOrganizationMap?
      updateUserOrganizationMap;

  @override
  List<Object?> get props => [updateUserOrganizationMap];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserOrganizationMap$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddUserPreference$MutationRoot$UserPreference extends JsonSerializable
    with EquatableMixin {
  AddUserPreference$MutationRoot$UserPreference();

  factory AddUserPreference$MutationRoot$UserPreference.fromJson(
          Map<String, dynamic> json) =>
      _$AddUserPreference$MutationRoot$UserPreferenceFromJson(json);

  @JsonKey(name: 'user_preference_id')
  String? userPreferenceId;

  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey(name: 'user_lsp_id')
  late String userLspId;

  @JsonKey(name: 'sub_category')
  late String subCategory;

  @JsonKey(name: 'is_base')
  late bool isBase;

  @JsonKey(name: 'is_active')
  late bool isActive;

  @override
  List<Object?> get props =>
      [userPreferenceId, userId, userLspId, subCategory, isBase, isActive];
  @override
  Map<String, dynamic> toJson() =>
      _$AddUserPreference$MutationRoot$UserPreferenceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddUserPreference$MutationRoot extends JsonSerializable
    with EquatableMixin {
  AddUserPreference$MutationRoot();

  factory AddUserPreference$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$AddUserPreference$MutationRootFromJson(json);

  List<AddUserPreference$MutationRoot$UserPreference?>? addUserPreference;

  @override
  List<Object?> get props => [addUserPreference];
  @override
  Map<String, dynamic> toJson() => _$AddUserPreference$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserPreference$MutationRoot$UserPreference extends JsonSerializable
    with EquatableMixin {
  UpdateUserPreference$MutationRoot$UserPreference();

  factory UpdateUserPreference$MutationRoot$UserPreference.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserPreference$MutationRoot$UserPreferenceFromJson(json);

  @JsonKey(name: 'user_preference_id')
  String? userPreferenceId;

  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey(name: 'user_lsp_id')
  late String userLspId;

  @JsonKey(name: 'sub_category')
  late String subCategory;

  @JsonKey(name: 'is_base')
  late bool isBase;

  @JsonKey(name: 'is_active')
  late bool isActive;

  @override
  List<Object?> get props =>
      [userPreferenceId, userId, userLspId, subCategory, isBase, isActive];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserPreference$MutationRoot$UserPreferenceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserPreference$MutationRoot extends JsonSerializable
    with EquatableMixin {
  UpdateUserPreference$MutationRoot();

  factory UpdateUserPreference$MutationRoot.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserPreference$MutationRootFromJson(json);

  UpdateUserPreference$MutationRoot$UserPreference? updateUserPreference;

  @override
  List<Object?> get props => [updateUserPreference];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserPreference$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLsps$QueryRoot$UserLspMap extends JsonSerializable
    with EquatableMixin, UserLspFragmentMixin {
  GetUserLsps$QueryRoot$UserLspMap();

  factory GetUserLsps$QueryRoot$UserLspMap.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserLsps$QueryRoot$UserLspMapFromJson(json);

  @override
  List<Object?> get props => [
        userLspId,
        userId,
        lspId,
        status,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserLsps$QueryRoot$UserLspMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLsps$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserLsps$QueryRoot();

  factory GetUserLsps$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserLsps$QueryRootFromJson(json);

  List<GetUserLsps$QueryRoot$UserLspMap?>? getUserLsps;

  @override
  List<Object?> get props => [getUserLsps];
  @override
  Map<String, dynamic> toJson() => _$GetUserLsps$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspByLspId$QueryRoot$UserLspMap extends JsonSerializable
    with EquatableMixin, UserLspFragmentMixin {
  GetUserLspByLspId$QueryRoot$UserLspMap();

  factory GetUserLspByLspId$QueryRoot$UserLspMap.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserLspByLspId$QueryRoot$UserLspMapFromJson(json);

  @override
  List<Object?> get props => [
        userLspId,
        userId,
        lspId,
        status,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserLspByLspId$QueryRoot$UserLspMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspByLspId$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserLspByLspId$QueryRoot();

  factory GetUserLspByLspId$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserLspByLspId$QueryRootFromJson(json);

  GetUserLspByLspId$QueryRoot$UserLspMap? getUserLspByLspId;

  @override
  List<Object?> get props => [getUserLspByLspId];
  @override
  Map<String, dynamic> toJson() => _$GetUserLspByLspId$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLearningSpaceDetails$QueryRoot$LearningSpace extends JsonSerializable
    with EquatableMixin, LearningSpaceFragmentMixin {
  GetLearningSpaceDetails$QueryRoot$LearningSpace();

  factory GetLearningSpaceDetails$QueryRoot$LearningSpace.fromJson(
          Map<String, dynamic> json) =>
      _$GetLearningSpaceDetails$QueryRoot$LearningSpaceFromJson(json);

  @override
  List<Object?> get props => [
        lspId,
        orgId,
        ouId,
        name,
        logoUrl,
        profileUrl,
        noUsers,
        owners,
        isDefault,
        status,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetLearningSpaceDetails$QueryRoot$LearningSpaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLearningSpaceDetails$QueryRoot extends JsonSerializable
    with EquatableMixin {
  GetLearningSpaceDetails$QueryRoot();

  factory GetLearningSpaceDetails$QueryRoot.fromJson(
          Map<String, dynamic> json) =>
      _$GetLearningSpaceDetails$QueryRootFromJson(json);

  List<GetLearningSpaceDetails$QueryRoot$LearningSpace?>?
      getLearningSpaceDetails;

  @override
  List<Object?> get props => [getLearningSpaceDetails];
  @override
  Map<String, dynamic> toJson() =>
      _$GetLearningSpaceDetails$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrganizations$QueryRoot$Organization extends JsonSerializable
    with EquatableMixin, OrganizationFragmentMixin {
  GetOrganizations$QueryRoot$Organization();

  factory GetOrganizations$QueryRoot$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrganizations$QueryRoot$OrganizationFromJson(json);

  @override
  List<Object?> get props => [
        orgId,
        name,
        logoUrl,
        industry,
        type,
        subdomain,
        employeeCount,
        website,
        linkedinUrl,
        facebookUrl,
        twitterUrl,
        status,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetOrganizations$QueryRoot$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetOrganizations$QueryRoot extends JsonSerializable with EquatableMixin {
  GetOrganizations$QueryRoot();

  factory GetOrganizations$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetOrganizations$QueryRootFromJson(json);

  List<GetOrganizations$QueryRoot$Organization?>? getOrganizations;

  @override
  List<Object?> get props => [getOrganizations];
  @override
  Map<String, dynamic> toJson() => _$GetOrganizations$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserDetails$QueryRoot$User extends JsonSerializable
    with EquatableMixin, UserFragmentMixin {
  GetUserDetails$QueryRoot$User();

  factory GetUserDetails$QueryRoot$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetails$QueryRoot$UserFromJson(json);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        status,
        role,
        isVerified,
        isActive,
        gender,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        email,
        phone,
        photoUrl
      ];
  @override
  Map<String, dynamic> toJson() => _$GetUserDetails$QueryRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserDetails$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserDetails$QueryRoot();

  factory GetUserDetails$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetails$QueryRootFromJson(json);

  List<GetUserDetails$QueryRoot$User?>? getUserDetails;

  @override
  List<Object?> get props => [getUserDetails];
  @override
  Map<String, dynamic> toJson() => _$GetUserDetails$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspRoles$QueryRoot$UserRole extends JsonSerializable
    with EquatableMixin, UserRoleFragmentMixin {
  GetUserLspRoles$QueryRoot$UserRole();

  factory GetUserLspRoles$QueryRoot$UserRole.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserLspRoles$QueryRoot$UserRoleFromJson(json);

  @override
  List<Object?> get props => [
        userRoleId,
        userId,
        userLspId,
        role,
        isActive,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserLspRoles$QueryRoot$UserRoleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspRoles$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserLspRoles$QueryRoot();

  factory GetUserLspRoles$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserLspRoles$QueryRootFromJson(json);

  List<GetUserLspRoles$QueryRoot$UserRole?>? getUserLspRoles;

  @override
  List<Object?> get props => [getUserLspRoles];
  @override
  Map<String, dynamic> toJson() => _$GetUserLspRoles$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrganizations$QueryRoot$UserOrganizationMap
    extends JsonSerializable
    with EquatableMixin, UserOrganizationFragmentMixin {
  GetUserOrganizations$QueryRoot$UserOrganizationMap();

  factory GetUserOrganizations$QueryRoot$UserOrganizationMap.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserOrganizations$QueryRoot$UserOrganizationMapFromJson(json);

  @override
  List<Object?> get props => [
        userOrganizationId,
        userId,
        userLspId,
        organizationId,
        organizationRole,
        isActive,
        employeeId,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserOrganizations$QueryRoot$UserOrganizationMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrganizations$QueryRoot extends JsonSerializable
    with EquatableMixin {
  GetUserOrganizations$QueryRoot();

  factory GetUserOrganizations$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrganizations$QueryRootFromJson(json);

  List<GetUserOrganizations$QueryRoot$UserOrganizationMap?>?
      getUserOrganizations;

  @override
  List<Object?> get props => [getUserOrganizations];
  @override
  Map<String, dynamic> toJson() => _$GetUserOrganizations$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrgDetails$QueryRoot$UserOrganizationMap extends JsonSerializable
    with EquatableMixin, UserOrganizationFragmentMixin {
  GetUserOrgDetails$QueryRoot$UserOrganizationMap();

  factory GetUserOrgDetails$QueryRoot$UserOrganizationMap.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserOrgDetails$QueryRoot$UserOrganizationMapFromJson(json);

  @override
  List<Object?> get props => [
        userOrganizationId,
        userId,
        userLspId,
        organizationId,
        organizationRole,
        isActive,
        employeeId,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserOrgDetails$QueryRoot$UserOrganizationMapToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrgDetails$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserOrgDetails$QueryRoot();

  factory GetUserOrgDetails$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrgDetails$QueryRootFromJson(json);

  GetUserOrgDetails$QueryRoot$UserOrganizationMap? getUserOrgDetails;

  @override
  List<Object?> get props => [getUserOrgDetails];
  @override
  Map<String, dynamic> toJson() => _$GetUserOrgDetails$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllCatMain$QueryRoot$CatMain extends JsonSerializable
    with EquatableMixin, AllCatMainFragmentMixin {
  AllCatMain$QueryRoot$CatMain();

  factory AllCatMain$QueryRoot$CatMain.fromJson(Map<String, dynamic> json) =>
      _$AllCatMain$QueryRoot$CatMainFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        code,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        isActive
      ];
  @override
  Map<String, dynamic> toJson() => _$AllCatMain$QueryRoot$CatMainToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllCatMain$QueryRoot extends JsonSerializable with EquatableMixin {
  AllCatMain$QueryRoot();

  factory AllCatMain$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$AllCatMain$QueryRootFromJson(json);

  List<AllCatMain$QueryRoot$CatMain?>? allCatMain;

  @override
  List<Object?> get props => [allCatMain];
  @override
  Map<String, dynamic> toJson() => _$AllCatMain$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatMain$QueryRoot$SubCatMain extends JsonSerializable
    with EquatableMixin, AllSubCatMainFragmentMixin {
  AllSubCatMain$QueryRoot$SubCatMain();

  factory AllSubCatMain$QueryRoot$SubCatMain.fromJson(
          Map<String, dynamic> json) =>
      _$AllSubCatMain$QueryRoot$SubCatMainFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        code,
        catId,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        isActive
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$AllSubCatMain$QueryRoot$SubCatMainToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatMain$QueryRoot extends JsonSerializable with EquatableMixin {
  AllSubCatMain$QueryRoot();

  factory AllSubCatMain$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$AllSubCatMain$QueryRootFromJson(json);

  List<AllSubCatMain$QueryRoot$SubCatMain?>? allSubCatMain;

  @override
  List<Object?> get props => [allSubCatMain];
  @override
  Map<String, dynamic> toJson() => _$AllSubCatMain$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatByCatId$QueryRoot$SubCatMain extends JsonSerializable
    with EquatableMixin, AllSubCatMainFragmentMixin {
  AllSubCatByCatId$QueryRoot$SubCatMain();

  factory AllSubCatByCatId$QueryRoot$SubCatMain.fromJson(
          Map<String, dynamic> json) =>
      _$AllSubCatByCatId$QueryRoot$SubCatMainFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        code,
        catId,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        isActive
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$AllSubCatByCatId$QueryRoot$SubCatMainToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatByCatId$QueryRoot extends JsonSerializable with EquatableMixin {
  AllSubCatByCatId$QueryRoot();

  factory AllSubCatByCatId$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$AllSubCatByCatId$QueryRootFromJson(json);

  List<AllSubCatByCatId$QueryRoot$SubCatMain?>? allSubCatByCatId;

  @override
  List<Object?> get props => [allSubCatByCatId];
  @override
  Map<String, dynamic> toJson() => _$AllSubCatByCatId$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferences$QueryRoot$UserPreference extends JsonSerializable
    with EquatableMixin, UserPreferenceFragmentMixin {
  GetUserPreferences$QueryRoot$UserPreference();

  factory GetUserPreferences$QueryRoot$UserPreference.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPreferences$QueryRoot$UserPreferenceFromJson(json);

  @override
  List<Object?> get props => [
        userPreferenceId,
        userId,
        userLspId,
        subCategory,
        isBase,
        isActive,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserPreferences$QueryRoot$UserPreferenceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferences$QueryRoot extends JsonSerializable
    with EquatableMixin {
  GetUserPreferences$QueryRoot();

  factory GetUserPreferences$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserPreferences$QueryRootFromJson(json);

  List<GetUserPreferences$QueryRoot$UserPreference?>? getUserPreferences;

  @override
  List<Object?> get props => [getUserPreferences];
  @override
  Map<String, dynamic> toJson() => _$GetUserPreferences$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferenceForLsp$QueryRoot$UserPreference extends JsonSerializable
    with EquatableMixin, UserPreferenceFragmentMixin {
  GetUserPreferenceForLsp$QueryRoot$UserPreference();

  factory GetUserPreferenceForLsp$QueryRoot$UserPreference.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPreferenceForLsp$QueryRoot$UserPreferenceFromJson(json);

  @override
  List<Object?> get props => [
        userPreferenceId,
        userId,
        userLspId,
        subCategory,
        isBase,
        isActive,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserPreferenceForLsp$QueryRoot$UserPreferenceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferenceForLsp$QueryRoot extends JsonSerializable
    with EquatableMixin {
  GetUserPreferenceForLsp$QueryRoot();

  factory GetUserPreferenceForLsp$QueryRoot.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPreferenceForLsp$QueryRootFromJson(json);

  GetUserPreferenceForLsp$QueryRoot$UserPreference? getUserPreferenceForLsp;

  @override
  List<Object?> get props => [getUserPreferenceForLsp];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserPreferenceForLsp$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LatestCourses$QueryRoot$PaginatedCourse$Course extends JsonSerializable
    with EquatableMixin, CourseFragmentMixin {
  LatestCourses$QueryRoot$PaginatedCourse$Course();

  factory LatestCourses$QueryRoot$PaginatedCourse$Course.fromJson(
          Map<String, dynamic> json) =>
      _$LatestCourses$QueryRoot$PaginatedCourse$CourseFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        lspId,
        publisher,
        description,
        summary,
        instructor,
        image,
        previewVideo,
        tileImage,
        owner,
        duration,
        expertiseLevel,
        language,
        benefits,
        outcomes,
        createdAt,
        updatedAt,
        type,
        prequisites,
        goodFor,
        mustFor,
        relatedSkills,
        publishDate,
        expiryDate,
        expectedCompletion,
        qaRequired,
        approvers,
        createdBy,
        updatedBy,
        status,
        isDisplay,
        category,
        subCategory,
        subCategories,
        isActive
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$LatestCourses$QueryRoot$PaginatedCourse$CourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LatestCourses$QueryRoot$PaginatedCourse extends JsonSerializable
    with EquatableMixin {
  LatestCourses$QueryRoot$PaginatedCourse();

  factory LatestCourses$QueryRoot$PaginatedCourse.fromJson(
          Map<String, dynamic> json) =>
      _$LatestCourses$QueryRoot$PaginatedCourseFromJson(json);

  List<LatestCourses$QueryRoot$PaginatedCourse$Course?>? courses;

  String? pageCursor;

  String? direction;

  int? pageSize;

  @override
  List<Object?> get props => [courses, pageCursor, direction, pageSize];
  @override
  Map<String, dynamic> toJson() =>
      _$LatestCourses$QueryRoot$PaginatedCourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LatestCourses$QueryRoot extends JsonSerializable with EquatableMixin {
  LatestCourses$QueryRoot();

  factory LatestCourses$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$LatestCourses$QueryRootFromJson(json);

  LatestCourses$QueryRoot$PaginatedCourse? latestCourses;

  @override
  List<Object?> get props => [latestCourses];
  @override
  Map<String, dynamic> toJson() => _$LatestCourses$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CourseFragmentMixin$SubCategories extends JsonSerializable
    with EquatableMixin {
  CourseFragmentMixin$SubCategories();

  factory CourseFragmentMixin$SubCategories.fromJson(
          Map<String, dynamic> json) =>
      _$CourseFragmentMixin$SubCategoriesFromJson(json);

  String? name;

  int? rank;

  @override
  List<Object?> get props => [name, rank];
  @override
  Map<String, dynamic> toJson() =>
      _$CourseFragmentMixin$SubCategoriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CoursesFilters extends JsonSerializable with EquatableMixin {
  CoursesFilters({
    this.lspId,
    this.category,
    this.subCategory,
    this.language,
    this.durationMin,
    this.durationMax,
    this.type,
    this.searchText,
  });

  factory CoursesFilters.fromJson(Map<String, dynamic> json) =>
      _$CoursesFiltersFromJson(json);

  @JsonKey(name: 'LspId')
  String? lspId;

  @JsonKey(name: 'Category')
  String? category;

  @JsonKey(name: 'SubCategory')
  String? subCategory;

  @JsonKey(name: 'Language')
  String? language;

  @JsonKey(name: 'DurationMin')
  int? durationMin;

  @JsonKey(name: 'DurationMax')
  int? durationMax;

  @JsonKey(name: 'Type')
  String? type;

  @JsonKey(name: 'SearchText')
  String? searchText;

  @override
  List<Object?> get props => [
        lspId,
        category,
        subCategory,
        language,
        durationMin,
        durationMax,
        type,
        searchText
      ];
  @override
  Map<String, dynamic> toJson() => _$CoursesFiltersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse
    extends JsonSerializable with EquatableMixin, UserCourseFragmentMixin {
  GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse();

  factory GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourseFromJson(
          json);

  @override
  List<Object?> get props => [
        userCourseId,
        userId,
        userLspId,
        lspId,
        courseId,
        courseType,
        addedBy,
        isMandatory,
        endDate,
        courseStatus,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseMaps$QueryRoot$PaginatedCourseMaps extends JsonSerializable
    with EquatableMixin {
  GetUserCourseMaps$QueryRoot$PaginatedCourseMaps();

  factory GetUserCourseMaps$QueryRoot$PaginatedCourseMaps.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserCourseMaps$QueryRoot$PaginatedCourseMapsFromJson(json);

  @JsonKey(name: 'user_courses')
  List<GetUserCourseMaps$QueryRoot$PaginatedCourseMaps$UserCourse?>?
      userCourses;

  String? pageCursor;

  String? direction;

  int? pageSize;

  @override
  List<Object?> get props => [userCourses, pageCursor, direction, pageSize];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserCourseMaps$QueryRoot$PaginatedCourseMapsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseMaps$QueryRoot extends JsonSerializable with EquatableMixin {
  GetUserCourseMaps$QueryRoot();

  factory GetUserCourseMaps$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetUserCourseMaps$QueryRootFromJson(json);

  GetUserCourseMaps$QueryRoot$PaginatedCourseMaps? getUserCourseMaps;

  @override
  List<Object?> get props => [getUserCourseMaps];
  @override
  Map<String, dynamic> toJson() => _$GetUserCourseMaps$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CourseMapFilters extends JsonSerializable with EquatableMixin {
  CourseMapFilters({
    this.lspId,
    this.isMandatory,
    this.status,
    this.type,
  });

  factory CourseMapFilters.fromJson(Map<String, dynamic> json) =>
      _$CourseMapFiltersFromJson(json);

  @JsonKey(name: 'lsp_id')
  List<String?>? lspId;

  @JsonKey(name: 'is_mandatory')
  bool? isMandatory;

  String? status;

  String? type;

  @override
  List<Object?> get props => [lspId, isMandatory, status, type];
  @override
  Map<String, dynamic> toJson() => _$CourseMapFiltersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress
    extends JsonSerializable
    with EquatableMixin, UserCourseProgressFragmentMixin {
  GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress();

  factory GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserCourseProgressByMapId$QueryRoot$UserCourseProgressFromJson(json);

  @override
  List<Object?> get props => [
        userCpId,
        userId,
        userCourseId,
        topicId,
        topicType,
        status,
        videoProgress,
        timeStamp,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserCourseProgressByMapId$QueryRoot$UserCourseProgressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseProgressByMapId$QueryRoot extends JsonSerializable
    with EquatableMixin {
  GetUserCourseProgressByMapId$QueryRoot();

  factory GetUserCourseProgressByMapId$QueryRoot.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserCourseProgressByMapId$QueryRootFromJson(json);

  List<GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress?>?
      getUserCourseProgressByMapId;

  @override
  List<Object?> get props => [getUserCourseProgressByMapId];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserCourseProgressByMapId$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCourse$QueryRoot$Course extends JsonSerializable
    with EquatableMixin, CourseFragmentMixin {
  GetCourse$QueryRoot$Course();

  factory GetCourse$QueryRoot$Course.fromJson(Map<String, dynamic> json) =>
      _$GetCourse$QueryRoot$CourseFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        lspId,
        publisher,
        description,
        summary,
        instructor,
        image,
        previewVideo,
        tileImage,
        owner,
        duration,
        expertiseLevel,
        language,
        benefits,
        outcomes,
        createdAt,
        updatedAt,
        type,
        prequisites,
        goodFor,
        mustFor,
        relatedSkills,
        publishDate,
        expiryDate,
        expectedCompletion,
        qaRequired,
        approvers,
        createdBy,
        updatedBy,
        status,
        isDisplay,
        category,
        subCategory,
        subCategories,
        isActive
      ];
  @override
  Map<String, dynamic> toJson() => _$GetCourse$QueryRoot$CourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCourse$QueryRoot extends JsonSerializable with EquatableMixin {
  GetCourse$QueryRoot();

  factory GetCourse$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetCourse$QueryRootFromJson(json);

  List<GetCourse$QueryRoot$Course?>? getCourse;

  @override
  List<Object?> get props => [getCourse];
  @override
  Map<String, dynamic> toJson() => _$GetCourse$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$MutationRoot$User extends JsonSerializable with EquatableMixin {
  Login$MutationRoot$User();

  factory Login$MutationRoot$User.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationRoot$UserFromJson(json);

  String? id;

  @JsonKey(name: 'first_name')
  late String firstName;

  @JsonKey(name: 'last_name')
  late String lastName;

  late String status;

  late String role;

  @JsonKey(name: 'is_verified')
  late bool isVerified;

  @JsonKey(name: 'is_active')
  late bool isActive;

  late String gender;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'updated_by')
  String? updatedBy;

  @JsonKey(name: 'created_at')
  late String createdAt;

  @JsonKey(name: 'updated_at')
  late String updatedAt;

  late String email;

  late String phone;

  @JsonKey(name: 'photo_url')
  String? photoUrl;

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        status,
        role,
        isVerified,
        isActive,
        gender,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        email,
        phone,
        photoUrl
      ];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationRoot$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$MutationRoot extends JsonSerializable with EquatableMixin {
  Login$MutationRoot();

  factory Login$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationRootFromJson(json);

  Login$MutationRoot$User? login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationRootToJson(this);
}

enum Status {
  @JsonValue('SAVED')
  saved,
  @JsonValue('APPROVAL_PENDING')
  approvalPending,
  @JsonValue('ON_HOLD')
  onHold,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('PUBLISHED')
  published,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments({
    this.id,
    required this.first_name,
    required this.last_name,
    required this.status,
    required this.role,
    required this.is_verified,
    required this.is_active,
    required this.gender,
    required this.email,
    required this.phone,
  });

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  final String? id;

  late String first_name;

  late String last_name;

  late String status;

  late String role;

  late bool is_verified;

  late bool is_active;

  late String gender;

  late String email;

  late String phone;

  @override
  List<Object?> get props => [
        id,
        first_name,
        last_name,
        status,
        role,
        is_verified,
        is_active,
        gender,
        email,
        phone
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

final UPDATE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'updateUser';
final UPDATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first_name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'last_name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'role')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_verified')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_active')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'gender')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phone')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'first_name'),
                value: VariableNode(name: NameNode(value: 'first_name')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'last_name'),
                value: VariableNode(name: NameNode(value: 'last_name')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'role'),
                value: VariableNode(name: NameNode(value: 'role')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_verified'),
                value: VariableNode(name: NameNode(value: 'is_verified')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_active'),
                value: VariableNode(name: NameNode(value: 'is_active')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'gender'),
                value: VariableNode(name: NameNode(value: 'gender')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'phone'),
                value: VariableNode(name: NameNode(value: 'phone')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'first_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'last_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_verified'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'created_by'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updated_by'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'created_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'photo_url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$MutationRoot, UpdateUserArguments> {
  UpdateUserMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUser$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUser$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddUserOrganizationMapArguments extends JsonSerializable
    with EquatableMixin {
  AddUserOrganizationMapArguments({
    required this.user_id,
    required this.user_lsp_id,
    required this.organization_id,
    required this.organization_role,
    required this.is_active,
    required this.employee_id,
  });

  @override
  factory AddUserOrganizationMapArguments.fromJson(Map<String, dynamic> json) =>
      _$AddUserOrganizationMapArgumentsFromJson(json);

  late String user_id;

  late String user_lsp_id;

  late String organization_id;

  late String organization_role;

  late bool is_active;

  late String employee_id;

  @override
  List<Object?> get props => [
        user_id,
        user_lsp_id,
        organization_id,
        organization_role,
        is_active,
        employee_id
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$AddUserOrganizationMapArgumentsToJson(this);
}

final ADD_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT_OPERATION_NAME =
    'addUserOrganizationMap';
final ADD_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addUserOrganizationMap'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'organization_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'organization_role')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_active')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addUserOrganizationMap'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_lsp_id'),
                value: VariableNode(name: NameNode(value: 'user_lsp_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'organization_id'),
                value: VariableNode(name: NameNode(value: 'organization_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'organization_role'),
                value: VariableNode(name: NameNode(value: 'organization_role')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_active'),
                value: VariableNode(name: NameNode(value: 'is_active')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: VariableNode(name: NameNode(value: 'employee_id')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_organization_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_lsp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'organization_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'organization_role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'employee_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class AddUserOrganizationMapMutation extends GraphQLQuery<
    AddUserOrganizationMap$MutationRoot, AddUserOrganizationMapArguments> {
  AddUserOrganizationMapMutation({required this.variables});

  @override
  final DocumentNode document = ADD_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT;

  @override
  final String operationName =
      ADD_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddUserOrganizationMapArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddUserOrganizationMap$MutationRoot parse(Map<String, dynamic> json) =>
      AddUserOrganizationMap$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserOrganizationMapArguments extends JsonSerializable
    with EquatableMixin {
  UpdateUserOrganizationMapArguments({
    required this.user_organization_id,
    required this.user_id,
    required this.user_lsp_id,
    required this.organization_id,
    required this.organization_role,
    required this.is_active,
    required this.employee_id,
  });

  @override
  factory UpdateUserOrganizationMapArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserOrganizationMapArgumentsFromJson(json);

  late String user_organization_id;

  late String user_id;

  late String user_lsp_id;

  late String organization_id;

  late String organization_role;

  late bool is_active;

  late String employee_id;

  @override
  List<Object?> get props => [
        user_organization_id,
        user_id,
        user_lsp_id,
        organization_id,
        organization_role,
        is_active,
        employee_id
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserOrganizationMapArgumentsToJson(this);
}

final UPDATE_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT_OPERATION_NAME =
    'updateUserOrganizationMap';
final UPDATE_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateUserOrganizationMap'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_organization_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'organization_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'organization_role')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_active')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'employee_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUserOrganizationMap'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_organization_id'),
                value:
                    VariableNode(name: NameNode(value: 'user_organization_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_lsp_id'),
                value: VariableNode(name: NameNode(value: 'user_lsp_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'organization_id'),
                value: VariableNode(name: NameNode(value: 'organization_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'organization_role'),
                value: VariableNode(name: NameNode(value: 'organization_role')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_active'),
                value: VariableNode(name: NameNode(value: 'is_active')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'employee_id'),
                value: VariableNode(name: NameNode(value: 'employee_id')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_organization_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_lsp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'organization_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'organization_role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'employee_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class UpdateUserOrganizationMapMutation extends GraphQLQuery<
    UpdateUserOrganizationMap$MutationRoot,
    UpdateUserOrganizationMapArguments> {
  UpdateUserOrganizationMapMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_USER_ORGANIZATION_MAP_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateUserOrganizationMapArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUserOrganizationMap$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUserOrganizationMap$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddUserPreferenceArguments extends JsonSerializable with EquatableMixin {
  AddUserPreferenceArguments({
    required this.user_id,
    required this.user_lsp_id,
    required this.sub_category,
    required this.is_base,
    required this.is_active,
  });

  @override
  factory AddUserPreferenceArguments.fromJson(Map<String, dynamic> json) =>
      _$AddUserPreferenceArgumentsFromJson(json);

  late String user_id;

  late String user_lsp_id;

  late String sub_category;

  late bool is_base;

  late bool is_active;

  @override
  List<Object?> get props =>
      [user_id, user_lsp_id, sub_category, is_base, is_active];
  @override
  Map<String, dynamic> toJson() => _$AddUserPreferenceArgumentsToJson(this);
}

final ADD_USER_PREFERENCE_MUTATION_DOCUMENT_OPERATION_NAME =
    'addUserPreference';
final ADD_USER_PREFERENCE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addUserPreference'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sub_category')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_base')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_active')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addUserPreference'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ListValueNode(values: [
              ObjectValueNode(fields: [
                ObjectFieldNode(
                  name: NameNode(value: 'user_id'),
                  value: VariableNode(name: NameNode(value: 'user_id')),
                ),
                ObjectFieldNode(
                  name: NameNode(value: 'user_lsp_id'),
                  value: VariableNode(name: NameNode(value: 'user_lsp_id')),
                ),
                ObjectFieldNode(
                  name: NameNode(value: 'sub_category'),
                  value: VariableNode(name: NameNode(value: 'sub_category')),
                ),
                ObjectFieldNode(
                  name: NameNode(value: 'is_base'),
                  value: VariableNode(name: NameNode(value: 'is_base')),
                ),
                ObjectFieldNode(
                  name: NameNode(value: 'is_active'),
                  value: VariableNode(name: NameNode(value: 'is_active')),
                ),
              ])
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_preference_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_lsp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sub_category'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_base'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class AddUserPreferenceMutation extends GraphQLQuery<
    AddUserPreference$MutationRoot, AddUserPreferenceArguments> {
  AddUserPreferenceMutation({required this.variables});

  @override
  final DocumentNode document = ADD_USER_PREFERENCE_MUTATION_DOCUMENT;

  @override
  final String operationName =
      ADD_USER_PREFERENCE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddUserPreferenceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddUserPreference$MutationRoot parse(Map<String, dynamic> json) =>
      AddUserPreference$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserPreferenceArguments extends JsonSerializable
    with EquatableMixin {
  UpdateUserPreferenceArguments({
    required this.user_preference_id,
    required this.user_id,
    required this.user_lsp_id,
    required this.sub_category,
    required this.is_base,
    required this.is_active,
  });

  @override
  factory UpdateUserPreferenceArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPreferenceArgumentsFromJson(json);

  late String user_preference_id;

  late String user_id;

  late String user_lsp_id;

  late String sub_category;

  late bool is_base;

  late bool is_active;

  @override
  List<Object?> get props => [
        user_preference_id,
        user_id,
        user_lsp_id,
        sub_category,
        is_base,
        is_active
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserPreferenceArgumentsToJson(this);
}

final UPDATE_USER_PREFERENCE_MUTATION_DOCUMENT_OPERATION_NAME =
    'updateUserPreference';
final UPDATE_USER_PREFERENCE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateUserPreference'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_preference_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sub_category')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_base')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_active')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUserPreference'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_preference_id'),
                value:
                    VariableNode(name: NameNode(value: 'user_preference_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_lsp_id'),
                value: VariableNode(name: NameNode(value: 'user_lsp_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'sub_category'),
                value: VariableNode(name: NameNode(value: 'sub_category')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_base'),
                value: VariableNode(name: NameNode(value: 'is_base')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'is_active'),
                value: VariableNode(name: NameNode(value: 'is_active')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_preference_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user_lsp_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sub_category'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_base'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class UpdateUserPreferenceMutation extends GraphQLQuery<
    UpdateUserPreference$MutationRoot, UpdateUserPreferenceArguments> {
  UpdateUserPreferenceMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_PREFERENCE_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_USER_PREFERENCE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateUserPreferenceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUserPreference$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUserPreference$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspsArguments extends JsonSerializable with EquatableMixin {
  GetUserLspsArguments({required this.userId});

  @override
  factory GetUserLspsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserLspsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetUserLspsArgumentsToJson(this);
}

final GET_USER_LSPS_QUERY_DOCUMENT_OPERATION_NAME = 'getUserLsps';
final GET_USER_LSPS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserLsps'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserLsps'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserLspFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserLspFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserLspMap'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserLspsQuery
    extends GraphQLQuery<GetUserLsps$QueryRoot, GetUserLspsArguments> {
  GetUserLspsQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_LSPS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_USER_LSPS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserLspsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserLsps$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserLsps$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspByLspIdArguments extends JsonSerializable with EquatableMixin {
  GetUserLspByLspIdArguments({
    required this.user_id,
    required this.lsp_id,
  });

  @override
  factory GetUserLspByLspIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserLspByLspIdArgumentsFromJson(json);

  late String user_id;

  late String lsp_id;

  @override
  List<Object?> get props => [user_id, lsp_id];
  @override
  Map<String, dynamic> toJson() => _$GetUserLspByLspIdArgumentsToJson(this);
}

final GET_USER_LSP_BY_LSP_ID_QUERY_DOCUMENT_OPERATION_NAME =
    'getUserLspByLspId';
final GET_USER_LSP_BY_LSP_ID_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserLspByLspId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserLspByLspId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'user_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'lsp_id'),
            value: VariableNode(name: NameNode(value: 'lsp_id')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserLspFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserLspFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserLspMap'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserLspByLspIdQuery extends GraphQLQuery<GetUserLspByLspId$QueryRoot,
    GetUserLspByLspIdArguments> {
  GetUserLspByLspIdQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_LSP_BY_LSP_ID_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_LSP_BY_LSP_ID_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserLspByLspIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserLspByLspId$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserLspByLspId$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetLearningSpaceDetailsArguments extends JsonSerializable
    with EquatableMixin {
  GetLearningSpaceDetailsArguments({this.lsp_ids});

  @override
  factory GetLearningSpaceDetailsArguments.fromJson(
          Map<String, dynamic> json) =>
      _$GetLearningSpaceDetailsArgumentsFromJson(json);

  final List<String?>? lsp_ids;

  @override
  List<Object?> get props => [lsp_ids];
  @override
  Map<String, dynamic> toJson() =>
      _$GetLearningSpaceDetailsArgumentsToJson(this);
}

final GET_LEARNING_SPACE_DETAILS_QUERY_DOCUMENT_OPERATION_NAME =
    'getLearningSpaceDetails';
final GET_LEARNING_SPACE_DETAILS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getLearningSpaceDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lsp_ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getLearningSpaceDetails'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'lsp_ids'),
            value: VariableNode(name: NameNode(value: 'lsp_ids')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'LearningSpaceFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'LearningSpaceFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'LearningSpace'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'org_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'ou_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'logo_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'profile_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'no_users'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'owners'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_default'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetLearningSpaceDetailsQuery extends GraphQLQuery<
    GetLearningSpaceDetails$QueryRoot, GetLearningSpaceDetailsArguments> {
  GetLearningSpaceDetailsQuery({required this.variables});

  @override
  final DocumentNode document = GET_LEARNING_SPACE_DETAILS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_LEARNING_SPACE_DETAILS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetLearningSpaceDetailsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetLearningSpaceDetails$QueryRoot parse(Map<String, dynamic> json) =>
      GetLearningSpaceDetails$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetOrganizationsArguments extends JsonSerializable with EquatableMixin {
  GetOrganizationsArguments({this.org_ids});

  @override
  factory GetOrganizationsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetOrganizationsArgumentsFromJson(json);

  final List<String?>? org_ids;

  @override
  List<Object?> get props => [org_ids];
  @override
  Map<String, dynamic> toJson() => _$GetOrganizationsArgumentsToJson(this);
}

final GET_ORGANIZATIONS_QUERY_DOCUMENT_OPERATION_NAME = 'getOrganizations';
final GET_ORGANIZATIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOrganizations'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'org_ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getOrganizations'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'org_ids'),
            value: VariableNode(name: NameNode(value: 'org_ids')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'OrganizationFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'OrganizationFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Organization'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'org_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'logo_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'industry'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'subdomain'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'employee_count'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'website'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'linkedin_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'facebook_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'twitter_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetOrganizationsQuery extends GraphQLQuery<GetOrganizations$QueryRoot,
    GetOrganizationsArguments> {
  GetOrganizationsQuery({required this.variables});

  @override
  final DocumentNode document = GET_ORGANIZATIONS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_ORGANIZATIONS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetOrganizationsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetOrganizations$QueryRoot parse(Map<String, dynamic> json) =>
      GetOrganizations$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserDetailsArguments extends JsonSerializable with EquatableMixin {
  GetUserDetailsArguments({required this.userId});

  @override
  factory GetUserDetailsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetUserDetailsArgumentsToJson(this);
}

final GET_USER_DETAILS_QUERY_DOCUMENT_OPERATION_NAME = 'getUserDetails';
final GET_USER_DETAILS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserDetails'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_ids'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'User'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'first_name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'last_name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'role'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_verified'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'gender'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'email'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'phone'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'photo_url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserDetailsQuery
    extends GraphQLQuery<GetUserDetails$QueryRoot, GetUserDetailsArguments> {
  GetUserDetailsQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_DETAILS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_USER_DETAILS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserDetailsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserDetails$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserDetails$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserLspRolesArguments extends JsonSerializable with EquatableMixin {
  GetUserLspRolesArguments({
    required this.user_id,
    required this.user_lsp_ids,
  });

  @override
  factory GetUserLspRolesArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserLspRolesArgumentsFromJson(json);

  late String user_id;

  late List<String> user_lsp_ids;

  @override
  List<Object?> get props => [user_id, user_lsp_ids];
  @override
  Map<String, dynamic> toJson() => _$GetUserLspRolesArgumentsToJson(this);
}

final GET_USER_LSP_ROLES_QUERY_DOCUMENT_OPERATION_NAME = 'getUserLspRoles';
final GET_USER_LSP_ROLES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserLspRoles'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserLspRoles'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'user_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'user_lsp_ids'),
            value: VariableNode(name: NameNode(value: 'user_lsp_ids')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserRoleFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserRoleFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserRole'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_role_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'role'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserLspRolesQuery
    extends GraphQLQuery<GetUserLspRoles$QueryRoot, GetUserLspRolesArguments> {
  GetUserLspRolesQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_LSP_ROLES_QUERY_DOCUMENT;

  @override
  final String operationName = GET_USER_LSP_ROLES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserLspRolesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserLspRoles$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserLspRoles$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrganizationsArguments extends JsonSerializable
    with EquatableMixin {
  GetUserOrganizationsArguments({required this.userId});

  @override
  factory GetUserOrganizationsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrganizationsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetUserOrganizationsArgumentsToJson(this);
}

final GET_USER_ORGANIZATIONS_QUERY_DOCUMENT_OPERATION_NAME =
    'getUserOrganizations';
final GET_USER_ORGANIZATIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserOrganizations'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserOrganizations'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserOrganizationFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserOrganizationFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserOrganizationMap'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_organization_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'organization_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'organization_role'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'employee_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserOrganizationsQuery extends GraphQLQuery<
    GetUserOrganizations$QueryRoot, GetUserOrganizationsArguments> {
  GetUserOrganizationsQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_ORGANIZATIONS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_ORGANIZATIONS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserOrganizationsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserOrganizations$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserOrganizations$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserOrgDetailsArguments extends JsonSerializable with EquatableMixin {
  GetUserOrgDetailsArguments({
    required this.userId,
    required this.user_lsp_id,
  });

  @override
  factory GetUserOrgDetailsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrgDetailsArgumentsFromJson(json);

  late String userId;

  late String user_lsp_id;

  @override
  List<Object?> get props => [userId, user_lsp_id];
  @override
  Map<String, dynamic> toJson() => _$GetUserOrgDetailsArgumentsToJson(this);
}

final GET_USER_ORG_DETAILS_QUERY_DOCUMENT_OPERATION_NAME = 'getUserOrgDetails';
final GET_USER_ORG_DETAILS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserOrgDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserOrgDetails'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'userId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'user_lsp_id'),
            value: VariableNode(name: NameNode(value: 'user_lsp_id')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserOrganizationFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserOrganizationFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserOrganizationMap'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_organization_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'organization_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'organization_role'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'employee_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserOrgDetailsQuery extends GraphQLQuery<GetUserOrgDetails$QueryRoot,
    GetUserOrgDetailsArguments> {
  GetUserOrgDetailsQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_ORG_DETAILS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_ORG_DETAILS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserOrgDetailsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserOrgDetails$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserOrgDetails$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AllCatMainArguments extends JsonSerializable with EquatableMixin {
  AllCatMainArguments({
    this.lsp_ids,
    this.searchText,
  });

  @override
  factory AllCatMainArguments.fromJson(Map<String, dynamic> json) =>
      _$AllCatMainArgumentsFromJson(json);

  final List<String?>? lsp_ids;

  final String? searchText;

  @override
  List<Object?> get props => [lsp_ids, searchText];
  @override
  Map<String, dynamic> toJson() => _$AllCatMainArgumentsToJson(this);
}

final ALL_CAT_MAIN_QUERY_DOCUMENT_OPERATION_NAME = 'allCatMain';
final ALL_CAT_MAIN_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'allCatMain'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lsp_ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'searchText')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allCatMain'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'lsp_ids'),
            value: VariableNode(name: NameNode(value: 'lsp_ids')),
          ),
          ArgumentNode(
            name: NameNode(value: 'searchText'),
            value: VariableNode(name: NameNode(value: 'searchText')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'allCatMainFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'allCatMainFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'CatMain'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'ImageUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Code'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'IsActive'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class AllCatMainQuery
    extends GraphQLQuery<AllCatMain$QueryRoot, AllCatMainArguments> {
  AllCatMainQuery({required this.variables});

  @override
  final DocumentNode document = ALL_CAT_MAIN_QUERY_DOCUMENT;

  @override
  final String operationName = ALL_CAT_MAIN_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final AllCatMainArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AllCatMain$QueryRoot parse(Map<String, dynamic> json) =>
      AllCatMain$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatMainArguments extends JsonSerializable with EquatableMixin {
  AllSubCatMainArguments({
    this.lsp_ids,
    this.searchText,
  });

  @override
  factory AllSubCatMainArguments.fromJson(Map<String, dynamic> json) =>
      _$AllSubCatMainArgumentsFromJson(json);

  final List<String?>? lsp_ids;

  final String? searchText;

  @override
  List<Object?> get props => [lsp_ids, searchText];
  @override
  Map<String, dynamic> toJson() => _$AllSubCatMainArgumentsToJson(this);
}

final ALL_SUB_CAT_MAIN_QUERY_DOCUMENT_OPERATION_NAME = 'allSubCatMain';
final ALL_SUB_CAT_MAIN_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'allSubCatMain'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lsp_ids')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'searchText')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allSubCatMain'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'lsp_ids'),
            value: VariableNode(name: NameNode(value: 'lsp_ids')),
          ),
          ArgumentNode(
            name: NameNode(value: 'searchText'),
            value: VariableNode(name: NameNode(value: 'searchText')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'allSubCatMainFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'allSubCatMainFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'SubCatMain'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'ImageUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Code'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CatId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'IsActive'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class AllSubCatMainQuery
    extends GraphQLQuery<AllSubCatMain$QueryRoot, AllSubCatMainArguments> {
  AllSubCatMainQuery({required this.variables});

  @override
  final DocumentNode document = ALL_SUB_CAT_MAIN_QUERY_DOCUMENT;

  @override
  final String operationName = ALL_SUB_CAT_MAIN_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final AllSubCatMainArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AllSubCatMain$QueryRoot parse(Map<String, dynamic> json) =>
      AllSubCatMain$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AllSubCatByCatIdArguments extends JsonSerializable with EquatableMixin {
  AllSubCatByCatIdArguments({this.catId});

  @override
  factory AllSubCatByCatIdArguments.fromJson(Map<String, dynamic> json) =>
      _$AllSubCatByCatIdArgumentsFromJson(json);

  final String? catId;

  @override
  List<Object?> get props => [catId];
  @override
  Map<String, dynamic> toJson() => _$AllSubCatByCatIdArgumentsToJson(this);
}

final ALL_SUB_CAT_BY_CAT_ID_QUERY_DOCUMENT_OPERATION_NAME = 'allSubCatByCatId';
final ALL_SUB_CAT_BY_CAT_ID_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'allSubCatByCatId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'catId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allSubCatByCatId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'catId'),
            value: VariableNode(name: NameNode(value: 'catId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'allSubCatMainFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'allSubCatMainFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'SubCatMain'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'ImageUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'Code'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CatId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'CreatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'UpdatedBy'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'IsActive'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class AllSubCatByCatIdQuery extends GraphQLQuery<AllSubCatByCatId$QueryRoot,
    AllSubCatByCatIdArguments> {
  AllSubCatByCatIdQuery({required this.variables});

  @override
  final DocumentNode document = ALL_SUB_CAT_BY_CAT_ID_QUERY_DOCUMENT;

  @override
  final String operationName =
      ALL_SUB_CAT_BY_CAT_ID_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final AllSubCatByCatIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AllSubCatByCatId$QueryRoot parse(Map<String, dynamic> json) =>
      AllSubCatByCatId$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferencesArguments extends JsonSerializable with EquatableMixin {
  GetUserPreferencesArguments({required this.userId});

  @override
  factory GetUserPreferencesArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserPreferencesArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetUserPreferencesArgumentsToJson(this);
}

final GET_USER_PREFERENCES_QUERY_DOCUMENT_OPERATION_NAME = 'getUserPreferences';
final GET_USER_PREFERENCES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserPreferences'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserPreferences'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserPreferenceFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserPreferenceFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserPreference'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_preference_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_base'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserPreferencesQuery extends GraphQLQuery<GetUserPreferences$QueryRoot,
    GetUserPreferencesArguments> {
  GetUserPreferencesQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_PREFERENCES_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_PREFERENCES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserPreferencesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPreferences$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserPreferences$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserPreferenceForLspArguments extends JsonSerializable
    with EquatableMixin {
  GetUserPreferenceForLspArguments({
    required this.user_id,
    required this.user_lsp_id,
  });

  @override
  factory GetUserPreferenceForLspArguments.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPreferenceForLspArgumentsFromJson(json);

  late String user_id;

  late String user_lsp_id;

  @override
  List<Object?> get props => [user_id, user_lsp_id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserPreferenceForLspArgumentsToJson(this);
}

final GET_USER_PREFERENCE_FOR_LSP_QUERY_DOCUMENT_OPERATION_NAME =
    'getUserPreferenceForLsp';
final GET_USER_PREFERENCE_FOR_LSP_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserPreferenceForLsp'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_lsp_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserPreferenceForLsp'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'user_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'user_lsp_id'),
            value: VariableNode(name: NameNode(value: 'user_lsp_id')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserPreferenceFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserPreferenceFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserPreference'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_preference_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_base'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserPreferenceForLspQuery extends GraphQLQuery<
    GetUserPreferenceForLsp$QueryRoot, GetUserPreferenceForLspArguments> {
  GetUserPreferenceForLspQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_PREFERENCE_FOR_LSP_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_PREFERENCE_FOR_LSP_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserPreferenceForLspArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPreferenceForLsp$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserPreferenceForLsp$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LatestCoursesArguments extends JsonSerializable with EquatableMixin {
  LatestCoursesArguments({
    this.publishTime,
    this.pageCursor,
    this.Direction,
    this.pageSize,
    this.status,
    this.filters,
  });

  @override
  factory LatestCoursesArguments.fromJson(Map<String, dynamic> json) =>
      _$LatestCoursesArgumentsFromJson(json);

  final int? publishTime;

  final String? pageCursor;

  final String? Direction;

  final int? pageSize;

  @JsonKey(unknownEnumValue: Status.artemisUnknown)
  final Status? status;

  final CoursesFilters? filters;

  @override
  List<Object?> get props =>
      [publishTime, pageCursor, Direction, pageSize, status, filters];
  @override
  Map<String, dynamic> toJson() => _$LatestCoursesArgumentsToJson(this);
}

final LATEST_COURSES_QUERY_DOCUMENT_OPERATION_NAME = 'latestCourses';
final LATEST_COURSES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'latestCourses'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'publishTime')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageCursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'Direction')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'Status'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filters')),
        type: NamedTypeNode(
          name: NameNode(value: 'CoursesFilters'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'latestCourses'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'publish_time'),
            value: VariableNode(name: NameNode(value: 'publishTime')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageCursor'),
            value: VariableNode(name: NameNode(value: 'pageCursor')),
          ),
          ArgumentNode(
            name: NameNode(value: 'Direction'),
            value: VariableNode(name: NameNode(value: 'Direction')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageSize'),
            value: VariableNode(name: NameNode(value: 'pageSize')),
          ),
          ArgumentNode(
            name: NameNode(value: 'status'),
            value: VariableNode(name: NameNode(value: 'status')),
          ),
          ArgumentNode(
            name: NameNode(value: 'filters'),
            value: VariableNode(name: NameNode(value: 'filters')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'courses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'courseFragment'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageCursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'direction'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pageSize'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'courseFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Course'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lspId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'publisher'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'summary'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'instructor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'image'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'previewVideo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tileImage'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'owner'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'duration'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expertise_level'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'language'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'benefits'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'outcomes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'prequisites'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'goodFor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'mustFor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'related_skills'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'publish_date'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expiry_date'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expected_completion'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'qa_required'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'approvers'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_display'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_categories'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rank'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class LatestCoursesQuery
    extends GraphQLQuery<LatestCourses$QueryRoot, LatestCoursesArguments> {
  LatestCoursesQuery({required this.variables});

  @override
  final DocumentNode document = LATEST_COURSES_QUERY_DOCUMENT;

  @override
  final String operationName = LATEST_COURSES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final LatestCoursesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  LatestCourses$QueryRoot parse(Map<String, dynamic> json) =>
      LatestCourses$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseMapsArguments extends JsonSerializable with EquatableMixin {
  GetUserCourseMapsArguments({
    required this.user_id,
    this.publish_time,
    this.pageCursor,
    this.pageSize,
    this.filters,
  });

  @override
  factory GetUserCourseMapsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserCourseMapsArgumentsFromJson(json);

  late String user_id;

  final int? publish_time;

  final String? pageCursor;

  final int? pageSize;

  final CourseMapFilters? filters;

  @override
  List<Object?> get props =>
      [user_id, publish_time, pageCursor, pageSize, filters];
  @override
  Map<String, dynamic> toJson() => _$GetUserCourseMapsArgumentsToJson(this);
}

final GET_USER_COURSE_MAPS_QUERY_DOCUMENT_OPERATION_NAME = 'GetUserCourseMaps';
final GET_USER_COURSE_MAPS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUserCourseMaps'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'publish_time')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageCursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pageSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filters')),
        type: NamedTypeNode(
          name: NameNode(value: 'CourseMapFilters'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserCourseMaps'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'user_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'publish_time'),
            value: VariableNode(name: NameNode(value: 'publish_time')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageCursor'),
            value: VariableNode(name: NameNode(value: 'pageCursor')),
          ),
          ArgumentNode(
            name: NameNode(value: 'Direction'),
            value: StringValueNode(
              value: '',
              isBlock: false,
            ),
          ),
          ArgumentNode(
            name: NameNode(value: 'pageSize'),
            value: VariableNode(name: NameNode(value: 'pageSize')),
          ),
          ArgumentNode(
            name: NameNode(value: 'filters'),
            value: VariableNode(name: NameNode(value: 'filters')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_courses'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'UserCourseFragment'),
                directives: [],
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageCursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'direction'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pageSize'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserCourseFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserCourse'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_course_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lsp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'course_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'course_type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'added_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_mandatory'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'end_date'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'course_status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserCourseMapsQuery extends GraphQLQuery<GetUserCourseMaps$QueryRoot,
    GetUserCourseMapsArguments> {
  GetUserCourseMapsQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_COURSE_MAPS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_COURSE_MAPS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserCourseMapsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserCourseMaps$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserCourseMaps$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserCourseProgressByMapIdArguments extends JsonSerializable
    with EquatableMixin {
  GetUserCourseProgressByMapIdArguments({
    required this.userId,
    this.userCourseId,
  });

  @override
  factory GetUserCourseProgressByMapIdArguments.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserCourseProgressByMapIdArgumentsFromJson(json);

  late String userId;

  final List<String>? userCourseId;

  @override
  List<Object?> get props => [userId, userCourseId];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserCourseProgressByMapIdArgumentsToJson(this);
}

final GET_USER_COURSE_PROGRESS_BY_MAP_ID_QUERY_DOCUMENT_OPERATION_NAME =
    'getUserCourseProgressByMapId';
final GET_USER_COURSE_PROGRESS_BY_MAP_ID_QUERY_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserCourseProgressByMapId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userCourseId')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserCourseProgressByMapId'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'userId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'user_course_id'),
            value: VariableNode(name: NameNode(value: 'userCourseId')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserCourseProgressFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'UserCourseProgressFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserCourseProgress'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user_cp_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user_course_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'topic_id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'topic_type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'video_progress'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'time_stamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetUserCourseProgressByMapIdQuery extends GraphQLQuery<
    GetUserCourseProgressByMapId$QueryRoot,
    GetUserCourseProgressByMapIdArguments> {
  GetUserCourseProgressByMapIdQuery({required this.variables});

  @override
  final DocumentNode document =
      GET_USER_COURSE_PROGRESS_BY_MAP_ID_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_COURSE_PROGRESS_BY_MAP_ID_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserCourseProgressByMapIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserCourseProgressByMapId$QueryRoot parse(Map<String, dynamic> json) =>
      GetUserCourseProgressByMapId$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetCourseArguments extends JsonSerializable with EquatableMixin {
  GetCourseArguments({this.course_id});

  @override
  factory GetCourseArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCourseArgumentsFromJson(json);

  final List<String?>? course_id;

  @override
  List<Object?> get props => [course_id];
  @override
  Map<String, dynamic> toJson() => _$GetCourseArgumentsToJson(this);
}

final GET_COURSE_QUERY_DOCUMENT_OPERATION_NAME = 'GetCourse';
final GET_COURSE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCourse'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'course_id')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getCourse'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'course_id'),
            value: VariableNode(name: NameNode(value: 'course_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'courseFragment'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'courseFragment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Course'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lspId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'publisher'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'summary'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'instructor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'image'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'previewVideo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tileImage'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'owner'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'duration'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expertise_level'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'language'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'benefits'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'outcomes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_at'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'type'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'prequisites'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'goodFor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'mustFor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'related_skills'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'publish_date'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expiry_date'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expected_completion'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'qa_required'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'approvers'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'created_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updated_by'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'is_display'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_category'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'sub_categories'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rank'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'is_active'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetCourseQuery
    extends GraphQLQuery<GetCourse$QueryRoot, GetCourseArguments> {
  GetCourseQuery({required this.variables});

  @override
  final DocumentNode document = GET_COURSE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_COURSE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetCourseArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetCourse$QueryRoot parse(Map<String, dynamic> json) =>
      GetCourse$QueryRoot.fromJson(json);
}

final LOGIN_MUTATION_DOCUMENT_OPERATION_NAME = 'login';
final LOGIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'login'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'first_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'last_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_verified'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_active'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'created_by'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updated_by'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'created_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updated_at'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'photo_url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class LoginMutation extends GraphQLQuery<Login$MutationRoot, JsonSerializable> {
  LoginMutation();

  @override
  final DocumentNode document = LOGIN_MUTATION_DOCUMENT;

  @override
  final String operationName = LOGIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Login$MutationRoot parse(Map<String, dynamic> json) =>
      Login$MutationRoot.fromJson(json);
}
