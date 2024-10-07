import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_bloc.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_events.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_states.dart';
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
      BlocProvider.of<GitRepoIssuesBloc>(context)
        .add(GitRepoIssuesPaginatedIssuesEvent(fullName: widget.id));
    });
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        BlocBuilder<GitRepoIssuesBloc, GitRepoIssuesState>(
          builder: (context, state) {
            if (state is GitIssueRepoSuccessState) {
              return Expanded(
                child: JobDetailsPage(),
              );
            } else if (state is GetIssueRepoErrorState) {
              return Center(child: Text(state.message));
            }
            return Expanded(
              child: JobDetailsPage(),
            );
          },
        ),
      ],
    );
  }

  AppBar _buildAppBar() => AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close)),
      title: Text('${widget.id} Issues'));
}




class JobDetailsPage extends StatelessWidget {
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
                leading: Image.network('https://via.placeholder.com/50'),
                title: Text('Hungerstation', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Technology, Information and Internet'),
              ),
              SizedBox(height: 16),
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
              Text(
                  'As a vital part of the sales team at Hungerstation, your role will focus on nurturing and closing B2B relations within the fields of Entrepreneurship and Hospitality. This junior position is meant for individuals who thrive at presenting excellent solutions and negotiating, ensuring both the client’s satisfaction and the success of our company.'),
              SizedBox(height: 16),
              Text('Key Responsibilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                  '• Initiate contact with potential business clients to introduce our unmatched services.\n• Effectively manage the entire sales process from the first contact to the deal’s closing.\n• Establish and uphold durable, long-term customer relationships.• Initiate contact with potential business clients to introduce our unmatched services.\n• Effectively manage the entire sales process from the first contact to the deal’s closing.\n• Establish and uphold durable, long-term customer relationships.• Initiate contact with potential business clients to introduce our unmatched services.\n• Effectively manage the entire sales process from the first contact to the deal’s closing.\n• Establish and uphold durable, long-term customer relationships.• Initiate contact with potential business clients to introduce our unmatched services.\n• Effectively manage the entire sales process from the first contact to the deal’s closing.\n• Establish and uphold durable, long-term customer relationships.'),
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
