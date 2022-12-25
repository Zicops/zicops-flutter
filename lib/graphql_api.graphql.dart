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
            name: NameNode(value: 'id'),
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
