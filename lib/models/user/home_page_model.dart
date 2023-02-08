import 'dart:ffi';

class UserCourseData {
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
  String? duration;
  String? expertise_level;
  String? language;
  String? benefits;
  String? outcomes;
  String? created_at;
  String? updated_at;
  String? type;
  String? prequisites;
  String? goodFor;
  String? mustFor;
  String? related_skills;
  String? publish_date;
  String? expiry_date;
  String? expected_completion;
  String? qa_required;
  String? approvers;
  String? created_by;
  String? updated_by;
  String? status;
  bool? is_display;
  String? category;
  String? sub_category;
  String? sub_categories;
  String? is_active;

  //user course data-members

  String? user_course_id;
  String? user_id;
  String? dataType;
  String? addedOn;
  String? expectedCompletion;
  int? timeLeft;
  String? added_by;
  bool? isCourseCompleted;
  bool? isCourseStarted;
  int? completedPercentage;
  int? topicsStartedPercentage;
  String? scheduleDate;
  String? endDate;

  UserCourseData(
      {this.id,
      this.name,
      this.publisher,
      this.description,
      this.expertise_level,
      this.owner,
      this.is_display,
      this.type,
      this.tileImage,
      this.image});
}
