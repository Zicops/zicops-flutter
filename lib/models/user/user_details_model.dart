class UserDetailsModel {
  String userID;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  UserDetailsModel(
    this.userID,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  );

  UserDetailsModel.fromJson(Map<String, dynamic> json)
      : userID = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        phoneNumber = json['phone'];

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}

// class UserDetailsList {
//   Future<List<UserDetailsModel>> getUserDetails() async {
//     final result = await userClient.client()?.execute(LoginMutation());
//     List<UserDetailsModel> userDetails = [];
//
//     List data = result?.data as List;
//     for (var e in data) {
//       userDetails.add(UserDetailsModel(
//         e["userID"],
//         e["firstName"],
//         e["lastName"],
//         e["email"],
//         e["phoneNumber"],
//       ));
//     }
//     return userDetails;
//   }
// }

//
// Future<List<UserDetailsModel>> getUserDetails() async {
//   final result = await userClient.client()?.execute(LoginMutation());
//   List<UserDetailsModel> userDetails = [];
//
//   List data = result?.data as List;
//   for (var e in data) {
//     userDetails.add(UserDetailsModel(
//       e["userID"],
//       e["firstName"],
//       e["lastName"],
//       e["email"],
//       e["phoneNumber"],
//     ));
//   }
//   return userDetails;
// }
