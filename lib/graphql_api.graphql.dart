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
          name: NameNode(value: 'ID'),
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
  GetUserOrgDetailsArguments({required this.userId});

  @override
  factory GetUserOrgDetailsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrgDetailsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
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
      )
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
class LatestCoursesArguments extends JsonSerializable with EquatableMixin {
  LatestCoursesArguments({
    this.publish_time,
    this.pageCursor,
    this.Direction,
    this.pageSize,
    this.status,
    this.filters,
  });

  @override
  factory LatestCoursesArguments.fromJson(Map<String, dynamic> json) =>
      _$LatestCoursesArgumentsFromJson(json);

  final int? publish_time;

  final String? pageCursor;

  final String? Direction;

  final int? pageSize;

  @JsonKey(unknownEnumValue: Status.artemisUnknown)
  final Status? status;

  final CoursesFilters? filters;

  @override
  List<Object?> get props =>
      [publish_time, pageCursor, Direction, pageSize, status, filters];
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
            value: VariableNode(name: NameNode(value: 'publish_time')),
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
