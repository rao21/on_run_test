// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetail _$JobDetailFromJson(Map<String, dynamic> json) => JobDetail(
      id: (json['id'] as num?)?.toInt(),
      createdDate: json['created_date'] as String?,
      salaryRange: (json['salary_range'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      location: json['location'] == null
          ? null
          : JobLocation.fromJson(json['location'] as Map<String, dynamic>),
      openForDiscussion: json['open_for_discussion'] as bool?,
      commissionBased: json['commission_based'] as bool?,
      type: json['type'] == null
          ? null
          : JobType.fromJson(json['type'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : JobStatus.fromJson(json['status'] as Map<String, dynamic>),
      workplacePreference: json['workplace_preference'] == null
          ? null
          : WorkplacePreference.fromJson(
              json['workplace_preference'] as Map<String, dynamic>),
      workplaceType: json['workplace_type'] == null
          ? null
          : WorkplaceType.fromJson(
              json['workplace_type'] as Map<String, dynamic>),
      vertical: json['vertical'] == null
          ? null
          : JobVertical.fromJson(json['vertical'] as Map<String, dynamic>),
      isPredefinedListSet: json['is_predefined_list_set'] as bool?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      icpAnswers: json['icp_answers'] == null
          ? null
          : IcpAnswers.fromJson(json['icp_answers'] as Map<String, dynamic>),
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      updatedDate: json['updated_date'] as String?,
      uniqueToken: json['unique_token'] as String?,
    );

Map<String, dynamic> _$JobDetailToJson(JobDetail instance) => <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate,
      'salary_range': instance.salaryRange,
      'benefits': instance.benefits,
      'location': instance.location?.toJson(),
      'open_for_discussion': instance.openForDiscussion,
      'commission_based': instance.commissionBased,
      'type': instance.type?.toJson(),
      'status': instance.status?.toJson(),
      'workplace_preference': instance.workplacePreference?.toJson(),
      'workplace_type': instance.workplaceType?.toJson(),
      'vertical': instance.vertical?.toJson(),
      'is_predefined_list_set': instance.isPredefinedListSet,
      'company': instance.company?.toJson(),
      'icp_answers': instance.icpAnswers?.toJson(),
      'uuid': instance.uuid,
      'title': instance.title,
      'updated_date': instance.updatedDate,
      'unique_token': instance.uniqueToken,
    };

JobLocation _$JobLocationFromJson(Map<String, dynamic> json) => JobLocation(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      listOrder: (json['list_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JobLocationToJson(JobLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'list_order': instance.listOrder,
    };

JobType _$JobTypeFromJson(Map<String, dynamic> json) => JobType(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JobTypeToJson(JobType instance) => <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'order': instance.order,
    };

JobStatus _$JobStatusFromJson(Map<String, dynamic> json) => JobStatus(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$JobStatusToJson(JobStatus instance) => <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

WorkplacePreference _$WorkplacePreferenceFromJson(Map<String, dynamic> json) =>
    WorkplacePreference(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$WorkplacePreferenceToJson(
        WorkplacePreference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

WorkplaceType _$WorkplaceTypeFromJson(Map<String, dynamic> json) =>
    WorkplaceType(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$WorkplaceTypeToJson(WorkplaceType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

JobVertical _$JobVerticalFromJson(Map<String, dynamic> json) => JobVertical(
      id: (json['id'] as num?)?.toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$JobVerticalToJson(JobVertical instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      industry: json['industry'] as String?,
      description: json['description'] as String?,
      website: json['website'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'industry': instance.industry,
      'description': instance.description,
      'website': instance.website,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
    };

IcpAnswers _$IcpAnswersFromJson(Map<String, dynamic> json) => IcpAnswers(
      jobRole: (json['job-role'] as List<dynamic>?)
          ?.map((e) => JobRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfSales: (json['type-of-sales'] as List<dynamic>?)
          ?.map((e) => TypeOfSales.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IcpAnswersToJson(IcpAnswers instance) =>
    <String, dynamic>{
      'job-role': instance.jobRole,
      'type-of-sales': instance.typeOfSales,
    };

JobRole _$JobRoleFromJson(Map<String, dynamic> json) => JobRole(
      id: (json['id'] as num?)?.toInt(),
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      nextQuestion: (json['next_question'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
    );

Map<String, dynamic> _$JobRoleToJson(JobRole instance) => <String, dynamic>{
      'id': instance.id,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'next_question': instance.nextQuestion,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
    };

TypeOfSales _$TypeOfSalesFromJson(Map<String, dynamic> json) => TypeOfSales(
      id: (json['id'] as num?)?.toInt(),
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      nextQuestion: (json['next_question'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
    );

Map<String, dynamic> _$TypeOfSalesToJson(TypeOfSales instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'next_question': instance.nextQuestion,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
    };
