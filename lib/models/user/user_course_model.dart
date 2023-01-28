import 'package:zicops/graphql_api.graphql.dart';

class Course {
  String? userCourseId;
  String? userId;
  String? userLspId;
  String? lspId;
  String? courseId;
  String? courseType;
  String? addedBy;
  bool? isMandatory;
  String? endDate;
  String? courseStatus;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  String? description;
  String? summary;
  String? instructor;
  String? image;
  String? previewVideo;
  String? tileImage;
  String? owner;
  String? publisher;
  int? duration;
  String? expertiseLevel;
  List<String>? language;
  List<String>? benefits;
  List<String>? outcomes;
  String? type;
  List<String>? prequisites;
  List<String>? goodFor;
  List<String>? mustFor;
  List<String>? relatedSkills;
  String? publishDate;
  String? expiryDate;
  String? expectedCompletion;
  bool? qaRequired;
  List<String>? approvers;
  String? status;
  bool? isActive;
  bool? isDisplay;
  String? category;
  String? subCategory;
  List<SubCategories>? subCategories;
  List<GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress?>? courseProgress;
  String? addedOn;
  int? timeLeft;
  bool? isCourseCompleted;
  bool? isCourseStarted;
  int? completedPercentage;
  int? topicsStartedPercentage;
  String? scheduleDate;
  String? dataType;

  Course(
      {this.userCourseId,
      this.userId,
      this.userLspId,
      this.lspId,
      this.courseId,
      this.courseType,
      this.addedBy,
      this.isMandatory,
      this.endDate,
      this.courseStatus,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.name,
      this.description,
      this.summary,
      this.instructor,
      this.image,
      this.previewVideo,
      this.tileImage,
      this.owner,
      this.publisher,
      this.duration,
      this.expertiseLevel,
      this.language,
      this.benefits,
      this.outcomes,
      this.type,
      this.prequisites,
      this.goodFor,
      this.mustFor,
      this.relatedSkills,
      this.publishDate,
      this.expiryDate,
      this.expectedCompletion,
      this.qaRequired,
      this.approvers,
      this.status,
      this.isActive,
      this.isDisplay,
      this.category,
      this.subCategory,
      this.subCategories,
      this.courseProgress,
      this.addedOn,
      this.timeLeft,
      this.isCourseCompleted,
      this.isCourseStarted,
      this.completedPercentage,
      this.topicsStartedPercentage,
      this.scheduleDate,
      this.dataType});

  Course.fromJson(Map<String, dynamic> json) {
    userCourseId = json['user_course_id'];
    userId = json['user_id'];
    userLspId = json['user_lsp_id'];
    lspId = json['lsp_id'];
    courseId = json['course_id'];
    courseType = json['course_type'];
    addedBy = json['added_by'];
    isMandatory = json['is_mandatory'];
    endDate = json['end_date'];
    courseStatus = json['course_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    name = json['name'];
    lspId = json['lspId'];
    description = json['description'];
    summary = json['summary'];
    instructor = json['instructor'];
    image = json['image'];
    previewVideo = json['previewVideo'];
    tileImage = json['tileImage'];
    owner = json['owner'];
    publisher = json['publisher'];
    duration = json['duration'];
    expertiseLevel = json['expertise_level'];
    language = json['language'].cast<String>();
    benefits = json['benefits'].cast<String>();
    outcomes = json['outcomes'].cast<String>();
    type = json['type'];
    prequisites = json['prequisites'].cast<String>();
    goodFor = json['goodFor'].cast<String>();
    mustFor = json['mustFor'].cast<String>();
    relatedSkills = json['related_skills'].cast<String>();
    publishDate = json['publish_date'];
    expiryDate = json['expiry_date'];
    expectedCompletion = json['expected_completion'];
    qaRequired = json['qa_required'];
    approvers = json['approvers'].cast<String>();
    status = json['status'];
    isActive = json['is_active'];
    isDisplay = json['is_display'];
    category = json['category'];
    subCategory = json['sub_category'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    if (json['courseProgres'] != null) {
      courseProgress = <GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress>[];
      json['courseProgres'].forEach((v) {
        courseProgress!.add(new GetUserCourseProgressByMapId$QueryRoot$UserCourseProgress.fromJson(v));
      });
    }
    addedOn = json['addedOn'];
    timeLeft = json['timeLeft'];
    isCourseCompleted = json['isCourseCompleted'];
    isCourseStarted = json['isCourseStarted'];
    completedPercentage = json['completedPercentage'];
    topicsStartedPercentage = json['topicsStartedPercentage'];
    scheduleDate = json['scheduleDate'];
    dataType = json['dataType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_course_id'] = this.userCourseId;
    data['user_id'] = this.userId;
    data['user_lsp_id'] = this.userLspId;
    data['lsp_id'] = this.lspId;
    data['course_id'] = this.courseId;
    data['course_type'] = this.courseType;
    data['added_by'] = this.addedBy;
    data['is_mandatory'] = this.isMandatory;
    data['end_date'] = this.endDate;
    data['course_status'] = this.courseStatus;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['lspId'] = this.lspId;
    data['description'] = this.description;
    data['summary'] = this.summary;
    data['instructor'] = this.instructor;
    data['image'] = this.image;
    data['previewVideo'] = this.previewVideo;
    data['tileImage'] = this.tileImage;
    data['owner'] = this.owner;
    data['publisher'] = this.publisher;
    data['duration'] = this.duration;
    data['expertise_level'] = this.expertiseLevel;
    data['language'] = this.language;
    data['benefits'] = this.benefits;
    data['outcomes'] = this.outcomes;
    data['type'] = this.type;
    data['prequisites'] = this.prequisites;
    data['goodFor'] = this.goodFor;
    data['mustFor'] = this.mustFor;
    data['related_skills'] = this.relatedSkills;
    data['publish_date'] = this.publishDate;
    data['expiry_date'] = this.expiryDate;
    data['expected_completion'] = this.expectedCompletion;
    data['qa_required'] = this.qaRequired;
    data['approvers'] = this.approvers;
    data['status'] = this.status;
    data['is_active'] = this.isActive;
    data['is_display'] = this.isDisplay;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    if (this.courseProgress != null) {
      data['courseProgres'] =
          this.courseProgress!.map((v) => v?.toJson()).toList();
    }
    data['addedOn'] = this.addedOn;
    data['timeLeft'] = this.timeLeft;
    data['isCourseCompleted'] = this.isCourseCompleted;
    data['isCourseStarted'] = this.isCourseStarted;
    data['completedPercentage'] = this.completedPercentage;
    data['topicsStartedPercentage'] = this.topicsStartedPercentage;
    data['scheduleDate'] = this.scheduleDate;
    data['dataType'] = this.dataType;
    return data;
  }
}

class SubCategories {
  String? name;
  int? rank;

  SubCategories({this.name, this.rank});

  SubCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rank'] = this.rank;
    return data;
  }
}

class CourseProgress {
  String? userCpId;
  String? userId;
  String? userCourseId;
  String? topicId;
  String? topicType;
  String? status;
  String? videoProgress;
  String? timeStamp;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  CourseProgress(
      {this.userCpId,
      this.userId,
      this.userCourseId,
      this.topicId,
      this.topicType,
      this.status,
      this.videoProgress,
      this.timeStamp,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  CourseProgress.fromJson(Map<String, dynamic> json) {
    userCpId = json['user_cp_id'];
    userId = json['user_id'];
    userCourseId = json['user_course_id'];
    topicId = json['topic_id'];
    topicType = json['topic_type'];
    status = json['status'];
    videoProgress = json['video_progress'];
    timeStamp = json['time_stamp'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_cp_id'] = this.userCpId;
    data['user_id'] = this.userId;
    data['user_course_id'] = this.userCourseId;
    data['topic_id'] = this.topicId;
    data['topic_type'] = this.topicType;
    data['status'] = this.status;
    data['video_progress'] = this.videoProgress;
    data['time_stamp'] = this.timeStamp;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
