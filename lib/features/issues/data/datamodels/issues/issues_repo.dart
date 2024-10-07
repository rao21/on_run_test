import 'package:json_annotation/json_annotation.dart';

part 'issues_repo.g.dart';

@JsonSerializable(explicitToJson: true)
class JobDetail {
  final int? id;
  @JsonKey(name: 'created_date')
  final String? createdDate;  // You can also use DateTime and handle formatting
  @JsonKey(name: 'salary_range')
  final List<int?>? salaryRange;
  final List<String?>? benefits;
  final JobLocation? location;
  @JsonKey(name: 'open_for_discussion')
  final bool? openForDiscussion;
  @JsonKey(name: 'commission_based')
  final bool? commissionBased;
  final JobType? type;
  final JobStatus? status;
  @JsonKey(name: 'workplace_preference')
  final WorkplacePreference? workplacePreference;
  @JsonKey(name: 'workplace_type')
  final WorkplaceType? workplaceType;
  final JobVertical? vertical;
  @JsonKey(name: 'is_predefined_list_set')
  final bool? isPredefinedListSet;
  final Company? company;
  @JsonKey(name: 'icp_answers')
  final IcpAnswers? icpAnswers;
  final String? uuid;
  final String? title;
  @JsonKey(name: 'updated_date')
  final String? updatedDate;
  @JsonKey(name: 'unique_token')
  final String? uniqueToken;

  JobDetail({
     this.id,
     this.createdDate,
     this.salaryRange,
     this.benefits,
     this.location,
     this.openForDiscussion,
     this.commissionBased,
     this.type,
     this.status,
     this.workplacePreference,
     this.workplaceType,
     this.vertical,
     this.isPredefinedListSet,
     this.company,
     this.icpAnswers,
     this.uuid,
     this.title,
     this.updatedDate,
     this.uniqueToken,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) => _$JobDetailFromJson(json);

  Map<String, dynamic> toJson() => _$JobDetailToJson(this);
}

@JsonSerializable()
class JobLocation {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'list_order')
  final int? listOrder;

  JobLocation({
     this.id,
     this.nameAr,
     this.nameEn,
     this.listOrder,
  });

  factory JobLocation.fromJson(Map<String, dynamic> json) => _$JobLocationFromJson(json);
  Map<String, dynamic> toJson() => _$JobLocationToJson(this);
}

@JsonSerializable()
class JobType {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  final int? order;

  JobType({
     this.id,
     this.nameAr,
     this.nameEn,
     this.order,
  });

  factory JobType.fromJson(Map<String, dynamic> json) => _$JobTypeFromJson(json);
  Map<String, dynamic> toJson() => _$JobTypeToJson(this);
}

@JsonSerializable()
class JobStatus {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;

  JobStatus({
     this.id,
     this.nameAr,
     this.nameEn,
  });

  factory JobStatus.fromJson(Map<String, dynamic> json) => _$JobStatusFromJson(json);
  Map<String, dynamic> toJson() => _$JobStatusToJson(this);
}

@JsonSerializable()
class WorkplacePreference {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;

  WorkplacePreference({
     this.id,
     this.nameAr,
     this.nameEn,
  });

  factory WorkplacePreference.fromJson(Map<String, dynamic> json) => _$WorkplacePreferenceFromJson(json);
  Map<String, dynamic> toJson() => _$WorkplacePreferenceToJson(this);
}

@JsonSerializable()
class WorkplaceType {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;

  WorkplaceType({
     this.id,
     this.nameAr,
     this.nameEn,
  });

  factory WorkplaceType.fromJson(Map<String, dynamic> json) => _$WorkplaceTypeFromJson(json);
  Map<String, dynamic> toJson() => _$WorkplaceTypeToJson(this);
}

@JsonSerializable()
class JobVertical {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;

  JobVertical({
     this.id,
     this.nameAr,
     this.nameEn,
  });

  factory JobVertical.fromJson(Map<String, dynamic> json) => _$JobVerticalFromJson(json);
  Map<String, dynamic> toJson() => _$JobVerticalToJson(this);
}

@JsonSerializable()
class Company {
  final String? name;
  final String? logo;
  final String? industry;
  final String? description;
  final String? website;
  final String? linkedin;
  final String? twitter;

  Company({
     this.name,
     this.logo,
     this.industry,
     this.description,
     this.website,
     this.linkedin,
     this.twitter,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class IcpAnswers {
  @JsonKey(name: 'job-role')
  final List<JobRole>? jobRole;
  @JsonKey(name: 'type-of-sales')
  final List<TypeOfSales>? typeOfSales;

  IcpAnswers({
     this.jobRole,
     this.typeOfSales,
  });

  factory IcpAnswers.fromJson(Map<String, dynamic> json) => _$IcpAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$IcpAnswersToJson(this);
}

@JsonSerializable()
class JobRole {
  final int? id;
  @JsonKey(name: 'title_ar')
  final String? titleAr;
  @JsonKey(name: 'title_en')
  final String? titleEn;
  @JsonKey(name: 'next_question')
  final List<String>? nextQuestion;
  @JsonKey(name: 'description_ar')
  final String? descriptionAr;
  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  JobRole({
     this.id,
     this.titleAr,
     this.titleEn,
     this.nextQuestion,
     this.descriptionAr,
     this.descriptionEn,
  });

  factory JobRole.fromJson(Map<String, dynamic> json) => _$JobRoleFromJson(json);
  Map<String, dynamic> toJson() => _$JobRoleToJson(this);
}

@JsonSerializable()
class TypeOfSales {
  final int? id;
  @JsonKey(name: 'title_ar')
  final String? titleAr;
  @JsonKey(name: 'title_en')
  final String? titleEn;
  @JsonKey(name: 'next_question')
  final List<String>? nextQuestion;
  @JsonKey(name: 'description_ar')
  final String? descriptionAr;
  @JsonKey(name: 'description_en')
  final String? descriptionEn;

  TypeOfSales({
     this.id,
     this.titleAr,
     this.titleEn,
     this.nextQuestion,
     this.descriptionAr,
     this.descriptionEn,
  });

  factory TypeOfSales.fromJson(Map<String, dynamic> json) => _$TypeOfSalesFromJson(json);
  Map<String, dynamic> toJson() => _$TypeOfSalesToJson(this);
}
