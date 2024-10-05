import 'package:json_annotation/json_annotation.dart';

part 'job_list_repo.g.dart';


@JsonSerializable(explicitToJson: true)
class JobResponse {
  final List<JobData> data;
  final int count;
  final String? nextLink;
  final String? prevLink;

  JobResponse({
    required this.data,
    required this.count,
    this.nextLink,
    this.prevLink,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) => _$JobResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JobResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobData {
  final Job job;

  JobData({required this.job});

  factory JobData.fromJson(Map<String, dynamic> json) => _$JobDataFromJson(json);
  Map<String, dynamic> toJson() => _$JobDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Job {
  final int id;
  final String? createdDate;
  final Location? location;
  @JsonKey(name: 'workplace_preference') final WorkplacePreference workplacePreference;
  @JsonKey(name: 'workplace_type') final WorkplaceType workplaceType;
  final Company? company;
  final String? uuid;
  final String? title;
  final String? updatedDate;
  Job({
    required this.id,
    required this.createdDate,
    required this.location,
    required this.company,
    required this.uuid,
    required this.title,
    required this.updatedDate,
    required this.workplacePreference,
    required this.workplaceType
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}

@JsonSerializable()
class Location {
  final int? id;
  @JsonKey(name: 'name_ar') final String? nameAr;
  @JsonKey(name: 'name_en') final String? nameEn;
  @JsonKey(name: 'list_order') final int? listOrder;

  Location({
    required this.id,
     this.nameAr,
     this.nameEn,
     this.listOrder,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class JobType {
  final int id;
  final String nameAr;
  final String nameEn;
  final int order;

  JobType({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.order,
  });

  factory JobType.fromJson(Map<String, dynamic> json) => _$JobTypeFromJson(json);
  Map<String, dynamic> toJson() => _$JobTypeToJson(this);
}

@JsonSerializable()
class JobStatus {
  final int id;
  final String nameAr;
  final String nameEn;

  JobStatus({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory JobStatus.fromJson(Map<String, dynamic> json) => _$JobStatusFromJson(json);
  Map<String, dynamic> toJson() => _$JobStatusToJson(this);
}

@JsonSerializable()
class WorkplacePreference {
  final int? id;
  @JsonKey(name: 'name_ar') final String? nameAr;
  @JsonKey(name: 'name_er') final String? nameEn;

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
  final int id;
 @JsonKey(name: 'name_ar') final String nameAr;
 @JsonKey(name: 'name_en') final String nameEn;

  WorkplaceType({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory WorkplaceType.fromJson(Map<String, dynamic> json) => _$WorkplaceTypeFromJson(json);
  Map<String, dynamic> toJson() => _$WorkplaceTypeToJson(this);
}

@JsonSerializable()
class Vertical {
  final int id;
  final String nameAr;
  final String nameEn;

  Vertical({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory Vertical.fromJson(Map<String, dynamic> json) => _$VerticalFromJson(json);
  Map<String, dynamic> toJson() => _$VerticalToJson(this);
}

@JsonSerializable()
class Company {
  final String name;
  final String logo;

  Company({
    required this.name,
    required this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class ICPAnswers {
  @JsonKey(name: 'job-role')
  final List<JobRole>? jobRole;
  @JsonKey(name: 'type-of-sales')
  final List<JobTypeOfSales>? typeOfSales;
  @JsonKey(name: 'commission-offered')
  final CommissionOffered commissionOffered;
  final bool relocationAllowance;

  ICPAnswers({
    required this.jobRole,
    required this.typeOfSales,
    required this.commissionOffered,
    required this.relocationAllowance,
  });

  factory ICPAnswers.fromJson(Map<String, dynamic> json) => _$ICPAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$ICPAnswersToJson(this);
}

@JsonSerializable()
class JobRole {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final List<String>? nextQuestion;
  final String? descriptionAr;
  final String? descriptionEn;

  JobRole({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.nextQuestion,
    required this.descriptionAr,
    required this.descriptionEn,
  });

  factory JobRole.fromJson(Map<String, dynamic> json) => _$JobRoleFromJson(json);
  Map<String, dynamic> toJson() => _$JobRoleToJson(this);
}

@JsonSerializable()
class JobTypeOfSales {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final List<String>? nextQuestion;
  final String? descriptionAr;
  final String? descriptionEn;

  JobTypeOfSales({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.nextQuestion,
    required this.descriptionAr,
    required this.descriptionEn,
  });

  factory JobTypeOfSales.fromJson(Map<String, dynamic> json) => _$JobTypeOfSalesFromJson(json);
  Map<String, dynamic> toJson() => _$JobTypeOfSalesToJson(this);
}

@JsonSerializable()
class CommissionOffered {
  final int id;
  final String titleAr;
  final String titleEn;

  CommissionOffered({
    required this.id,
    required this.titleAr,
    required this.titleEn,
  });

  factory CommissionOffered.fromJson(Map<String, dynamic> json) => _$CommissionOfferedFromJson(json);
  Map<String, dynamic> toJson() => _$CommissionOfferedToJson(this);
}

@JsonSerializable()
class Filters {
  final int? test;

  Filters({this.test});

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}
