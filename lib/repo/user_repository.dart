import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user/user_account_profile_pref.dart';
import '../models/user/user_model.dart';
import '../models/user/user_org_model.dart';

// class TodoRepository {
//   final uuid = const Uuid();
//   List<Todo> todoList = [];
//
//   List<Todo> addTodo(String todoTitle) {
//     final todo = Todo(todoTitle, uuid.v4(), false);
//     todoList.add(todo);
//     return todoList;
//   }
//
//   List<Todo> removeTodo(String id) {
//     todoList.removeWhere((element) => element.todoId == id);
//     return todoList;
//   }
//
//   List<Todo> updateTodoState(bool isCompleted, String id) {
//     for (Todo element in todoList) {
//       if (element.todoId == id) {
//         element.isCompleted = isCompleted;
//       }
//     }
//     return todoList;
//   }
// }

class UserRepository {
  List<UserModel> userDetails = [];
  Future<List<UserModel>> getUserDetails() async {
    final result = await userClient.client()?.execute(LoginMutation());
    userDetails.add(
      UserModel(
        result?.data?.login?.id ?? "",
        result?.data?.login?.firstName ?? "",
        result?.data?.login?.lastName ?? "",
        result?.data?.login?.status ?? "",
        result?.data?.login?.role ?? "",
        result?.data?.login?.isVerified ?? false,
        result?.data?.login?.isActive ?? false,
        result?.data?.login?.gender ?? "",
        result?.data?.login?.email ?? "",
        result?.data?.login?.phone ?? "",
        result?.data?.login?.photoUrl ?? "",
      ),
    );
    return userDetails;
  }

  //Note: Add mutation for update user details

}
