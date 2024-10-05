// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_list_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobResponse _$JobResponseFromJson(Map<String, dynamic> json) => JobResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => JobData.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      nextLink: json['nextLink'] as String?,
      prevLink: json['prevLink'] as String?,
    );

Map<String, dynamic> _$JobResponseToJson(JobResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'nextLink': instance.nextLink,
      'prevLink': instance.prevLink,
    };

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
      job: Job.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobDataToJson(JobData instance) => <String, dynamic>{
      'job': instance.job.toJson(),
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: (json['id'] as num).toInt(),
      createdDate: json['createdDate'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      updatedDate: json['updatedDate'] as String?,
      workplacePreference: WorkplacePreference.fromJson(
          json['workplace_preference'] as Map<String, dynamic>),
      workplaceType: WorkplaceType.fromJson(
          json['workplace_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'location': instance.location?.toJson(),
      'workplace_preference': instance.workplacePreference.toJson(),
      'workplace_type': instance.workplaceType.toJson(),
      'company': instance.company?.toJson(),
      'uuid': instance.uuid,
      'title': instance.title,
      'updatedDate': instance.updatedDate,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      listOrder: (json['list_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'list_order': instance.listOrder,
    };

JobType _$JobTypeFromJson(Map<String, dynamic> json) => JobType(
      id: (json['id'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$JobTypeToJson(JobType instance) => <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'order': instance.order,
    };

JobStatus _$JobStatusFromJson(Map<String, dynamic> json) => JobStatus(
      id: (json['id'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$JobStatusToJson(JobStatus instance) => <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

WorkplacePreference _$WorkplacePreferenceFromJson(Map<String, dynamic> json) =>
    WorkplacePreference(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_er'] as String?,
    );

Map<String, dynamic> _$WorkplacePreferenceToJson(
        WorkplacePreference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_er': instance.nameEn,
    };

WorkplaceType _$WorkplaceTypeFromJson(Map<String, dynamic> json) =>
    WorkplaceType(
      id: (json['id'] as num).toInt(),
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
    );

Map<String, dynamic> _$WorkplaceTypeToJson(WorkplaceType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

Vertical _$VerticalFromJson(Map<String, dynamic> json) => Vertical(
      id: (json['id'] as num).toInt(),
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$VerticalToJson(Vertical instance) => <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
    };

ICPAnswers _$ICPAnswersFromJson(Map<String, dynamic> json) => ICPAnswers(
      jobRole: (json['job-role'] as List<dynamic>?)
          ?.map((e) => JobRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfSales: (json['type-of-sales'] as List<dynamic>?)
          ?.map((e) => JobTypeOfSales.fromJson(e as Map<String, dynamic>))
          .toList(),
      commissionOffered: CommissionOffered.fromJson(
          json['commission-offered'] as Map<String, dynamic>),
      relocationAllowance: json['relocationAllowance'] as bool,
    );

Map<String, dynamic> _$ICPAnswersToJson(ICPAnswers instance) =>
    <String, dynamic>{
      'job-role': instance.jobRole,
      'type-of-sales': instance.typeOfSales,
      'commission-offered': instance.commissionOffered,
      'relocationAllowance': instance.relocationAllowance,
    };

JobRole _$JobRoleFromJson(Map<String, dynamic> json) => JobRole(
      id: (json['id'] as num?)?.toInt(),
      titleAr: json['titleAr'] as String?,
      titleEn: json['titleEn'] as String?,
      nextQuestion: (json['nextQuestion'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
    );

Map<String, dynamic> _$JobRoleToJson(JobRole instance) => <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'nextQuestion': instance.nextQuestion,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
    };

JobTypeOfSales _$JobTypeOfSalesFromJson(Map<String, dynamic> json) =>
    JobTypeOfSales(
      id: (json['id'] as num?)?.toInt(),
      titleAr: json['titleAr'] as String?,
      titleEn: json['titleEn'] as String?,
      nextQuestion: (json['nextQuestion'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
    );

Map<String, dynamic> _$JobTypeOfSalesToJson(JobTypeOfSales instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'nextQuestion': instance.nextQuestion,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
    };

CommissionOffered _$CommissionOfferedFromJson(Map<String, dynamic> json) =>
    CommissionOffered(
      id: (json['id'] as num).toInt(),
      titleAr: json['titleAr'] as String,
      titleEn: json['titleEn'] as String,
    );

Map<String, dynamic> _$CommissionOfferedToJson(CommissionOffered instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      test: (json['test'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'test': instance.test,
    };
