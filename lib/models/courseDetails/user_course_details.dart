class UserNotes {
  String? userNotesId;
  String? userId;
  String? userLspId;
  String? courseId;
  String? moduleId;
  String? topicId;
  int? sequence;
  String? status;
  String? details;
  bool? isActive;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  UserNotes(
      {this.userNotesId,
      this.userId,
      this.userLspId,
      this.courseId,
      this.moduleId,
      this.topicId,
      this.sequence,
      this.status,
      this.details,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  UserNotes.fromJson(Map<String, dynamic> json) {
    userNotesId = json['user_notes_id'];
    userId = json['user_id'];
    userLspId = json['user_lsp_id'];
    courseId = json['course_id'];
    moduleId = json['module_id'];
    topicId = json['topic_id'];
    sequence = json['sequence'];
    status = json['status'];
    details = json['details'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_notes_id'] = this.userNotesId;
    data['user_id'] = this.userId;
    data['user_lsp_id'] = this.userLspId;
    data['course_id'] = this.courseId;
    data['module_id'] = this.moduleId;
    data['topic_id'] = this.topicId;
    data['sequence'] = this.sequence;
    data['status'] = this.status;
    data['details'] = this.details;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserBookmarks {
  String? userBmId;
  String? userId;
  String? userLspId;
  String? userCourseId;
  String? courseId;
  String? moduleId;
  String? topicId;
  String? name;
  String? timeStamp;
  bool? isActive;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  UserBookmarks(
      {this.userBmId,
      this.userId,
      this.userLspId,
      this.userCourseId,
      this.courseId,
      this.moduleId,
      this.topicId,
      this.name,
      this.timeStamp,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  UserBookmarks.fromJson(Map<String, dynamic> json) {
    userBmId = json['user_bm_id'];
    userId = json['user_id'];
    userLspId = json['user_lsp_id'];
    userCourseId = json['user_course_id'];
    courseId = json['course_id'];
    moduleId = json['module_id'];
    topicId = json['topic_id'];
    name = json['name'];
    timeStamp = json['time_stamp'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_bm_id'] = this.userBmId;
    data['user_id'] = this.userId;
    data['user_lsp_id'] = this.userLspId;
    data['user_course_id'] = this.userCourseId;
    data['course_id'] = this.courseId;
    data['module_id'] = this.moduleId;
    data['topic_id'] = this.topicId;
    data['name'] = this.name;
    data['time_stamp'] = this.timeStamp;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
