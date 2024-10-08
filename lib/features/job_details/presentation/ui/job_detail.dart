import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/job/widgets/loading_widget.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_bloc.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_events.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_issue_states.dart';
import 'package:on_run_test/features/job/presentation/ui/job_list.dart';

class GitReposIssuesListPage extends StatefulWidget {
  const GitReposIssuesListPage({Key? key, required this.id})
      : super(key: key);
  final String id;

  @override
  State<GitReposIssuesListPage> createState() => _GitReposIssuesListPageState();
}

class _GitReposIssuesListPageState extends State<GitReposIssuesListPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<JobDetailBloc>(context)
        .add(JobDetailIssuesPaginatedIssuesEvent(fullName: widget.id));
    });
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<JobDetailBloc, JobDetailState>(
            builder: (context, state) {
              if (state is JobDetailSuccessState) {
                return Expanded(
                  child: JobDetailsPage(obj: state.data,),
                );
              } else if (state is JobDetailErrorState) {
                return Center(child: Text(state.message));
              } 
              return const LoadingWidget();
            },
          ),
        ],
      ),
    );
  }

}

class JobDetailsPage extends StatelessWidget {
  final JobDetail obj;
  JobDetailsPage({required this.obj});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Image.network(obj.company?.logo ?? ''),
                title: Text(obj.company?.name ?? '-', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(obj.company?.industry ?? '-'),
              ),
             const SizedBox(height: 16),
              Text('Business Development Associate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Riyadh · Onsite · Fulltime'),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: [
                  Chip(label: Text('B2B')),
                  Chip(label: Text('Sales')),
                  Chip(label: Text('No Experience')),
                  Chip(label: Text('Beginner English')),
                ],
              ),
              SizedBox(height: 16),
              Text('Job Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ListView(shrinkWrap: true,children: obj.icpAnswers!.jobRole!.map((e)=>Text(obj.icpAnswers?.jobRole?.first.descriptionEn ?? '')).toList(),),
              SizedBox(height: 16),
              Text('Key Responsibilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              ListView(shrinkWrap: true,children: obj.icpAnswers!.typeOfSales!.map((e)=>Text('• ${obj.icpAnswers?.jobRole?.first.descriptionEn ?? ''}')).toList(),)
              
            ],
          ),
        ),
      ),
      bottomNavigationBar:bottomNavigationBar,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 64,left: 16,right: 16),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: Text('Apply', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.purple,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
