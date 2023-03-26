
class CourseResource {
  String? id;
  String? name;
  String? type;
  String? topicId;
  String? courseId;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? url;

  CourseResource(
      {this.id,
      this.name,
      this.type,
      this.topicId,
      this.courseId,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.url});

  CourseResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    topicId = json['topicId'];
    courseId = json['courseId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['topicId'] = this.topicId;
    data['courseId'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['url'] = this.url;
    return data;
  }
}

class CourseTopic {
  String? id;
  String? name;
  String? description;
  String? type;
  String? moduleId;
  String? chapterId;
  String? courseId;
  String? createdAt;
  String? updatedAt;
  int? sequence;
  String? createdBy;
  String? updatedBy;
  String? image;

  CourseTopic(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.moduleId,
      this.chapterId,
      this.courseId,
      this.createdAt,
      this.updatedAt,
      this.sequence,
      this.createdBy,
      this.updatedBy,
      this.image});

  CourseTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    moduleId = json['moduleId'];
    chapterId = json['chapterId'];
    courseId = json['courseId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sequence = json['sequence'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['moduleId'] = this.moduleId;
    data['chapterId'] = this.chapterId;
    data['courseId'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sequence'] = this.sequence;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['image'] = this.image;
    return data;
  }
}

class CourseChapter {
  String? id;
  String? name;
  String? description;
  String? moduleId;
  String? courseId;
  String? createdAt;
  String? updatedAt;
  int? sequence;

  CourseChapter(
      {this.id,
      this.name,
      this.description,
      this.moduleId,
      this.courseId,
      this.createdAt,
      this.updatedAt,
      this.sequence});

  CourseChapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    moduleId = json['moduleId'];
    courseId = json['courseId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['moduleId'] = this.moduleId;
    data['courseId'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sequence'] = this.sequence;
    return data;
  }
}

class CourseModule {
  String? id;
  String? name;
  bool? isChapter;
  String? description;
  String? courseId;
  String? owner;
  int? duration;
  String? createdAt;
  String? updatedAt;
  String? level;
  int? sequence;
  bool? setGlobal;

  CourseModule(
      {this.id,
      this.name,
      this.isChapter,
      this.description,
      this.courseId,
      this.owner,
      this.duration,
      this.createdAt,
      this.updatedAt,
      this.level,
      this.sequence,
      this.setGlobal});

  CourseModule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isChapter = json['isChapter'];
    description = json['description'];
    courseId = json['courseId'];
    owner = json['owner'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    level = json['level'];
    sequence = json['sequence'];
    setGlobal = json['setGlobal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isChapter'] = this.isChapter;
    data['description'] = this.description;
    data['courseId'] = this.courseId;
    data['owner'] = this.owner;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['level'] = this.level;
    data['sequence'] = this.sequence;
    data['setGlobal'] = this.setGlobal;
    return data;
  }
}

class CourseTopicContent {
  String? id;
  String? language;
  String? topicId;
  String? courseId;
  int? startTime;
  int? duration;
  int? skipIntroDuration;
  int? nextShowTime;
  int? fromEndTime;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? contentUrl;
  List<SubtitleUrl>? subtitleUrl;
  bool? isDefault;

  CourseTopicContent(
      {this.id,
      this.language,
      this.topicId,
      this.courseId,
      this.startTime,
      this.duration,
      this.skipIntroDuration,
      this.nextShowTime,
      this.fromEndTime,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.contentUrl,
      this.subtitleUrl,
      this.isDefault});

  CourseTopicContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    topicId = json['topicId'];
    courseId = json['courseId'];
    startTime = json['startTime'];
    duration = json['duration'];
    skipIntroDuration = json['skipIntroDuration'];
    nextShowTime = json['nextShowTime'];
    fromEndTime = json['fromEndTime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    contentUrl = json['contentUrl'];
    if (json['subtitleUrl'] != null) {
      subtitleUrl = <SubtitleUrl>[];
      json['subtitleUrl'].forEach((v) {
        subtitleUrl!.add(new SubtitleUrl.fromJson(v));
      });
    }
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language'] = this.language;
    data['topicId'] = this.topicId;
    data['courseId'] = this.courseId;
    data['startTime'] = this.startTime;
    data['duration'] = this.duration;
    data['skipIntroDuration'] = this.skipIntroDuration;
    data['nextShowTime'] = this.nextShowTime;
    data['fromEndTime'] = this.fromEndTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['contentUrl'] = this.contentUrl;
    if (this.subtitleUrl != null) {
      data['subtitleUrl'] = this.subtitleUrl!.map((v) => v.toJson()).toList();
    }
    data['is_default'] = this.isDefault;
    return data;
  }
}

class SubtitleUrl {
  String? url;
  String? language;

  SubtitleUrl({this.url, this.language});

  SubtitleUrl.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['language'] = this.language;
    return data;
  }
}