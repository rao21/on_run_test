
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';

class JobUI {
  final String? id;
  final String? createdDate;
  final String location;
  final String? uuid;
  final String title;
  final String? updatedDate;
  final String companyUrl;
  final String subTitle;

  JobUI({
    required this.id,
    required this.createdDate,
    required this.location,
    required this.uuid,
    required this.title,
    required this.updatedDate,
    required this.companyUrl,
    required this.subTitle
  });

  static JobUI fromResponse(JobData json) {
    var obj = json.job;
    return JobUI(
      companyUrl: obj.company?.logo ?? '-',
      createdDate: obj.createdDate,
      id: obj.id.toString(),
      location: '${obj.location?.nameEn} . ${obj.workplaceType.nameEn}',
      title: obj.title ?? '-',
      updatedDate: obj.updatedDate,
      uuid: obj.uuid,
      subTitle: obj.company?.name ?? '-'
    );
  } 

}
