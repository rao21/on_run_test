import 'package:flutter/material.dart';
import 'package:on_run_test/features/job/presentation/ui/job_ui_model.dart';
import 'package:on_run_test/features/job/widgets/job_company_logo.dart';

class JobCard extends StatelessWidget {
  final JobUI job;

  const JobCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading:  
                CompanyLogoWidget(companyUrl: job.companyUrl),
              title:         Text(job.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                     subtitle:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(job.subTitle),
                         Text(job.location, style:const TextStyle(color: Colors.grey)),
                       ],
                     ),
                      
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,children: [
              Text(job.updatedDate ?? '-')
            ],)
          ],
        ),
      ),
    );
  }
}

