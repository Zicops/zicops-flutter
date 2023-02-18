import 'package:get/get.dart';
import 'package:zicops/models/user/user_details_model.dart';

import '../models/user/user_course_model.dart';

class Controller extends GetxController {
  List latestCourses = [].obs;
  List lspCourses = [].obs;
  List learningFolderCourses = [].obs;
  List subCatCourses1 = [].obs;
  List subCatCourses2 = [].obs;
  List subCatCourses3 = [].obs;
  List subCatCourses4 = [].obs;
  List subCatCourses5 = [].obs;
  List courseDataOne = [].obs;
  List userPreferences = [].obs;
  List<dynamic> topicData = [].obs;

  late UserDetailsModel userDetails;
}
