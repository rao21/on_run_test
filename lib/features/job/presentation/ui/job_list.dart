import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:on_run_test/features/job_details/presentation/ui/job_detail.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_events.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_states.dart';
import 'package:on_run_test/features/job/presentation/ui/job_ui_model.dart';
import 'package:on_run_test/features/job/widgets/lazy_list.dart';
import 'package:on_run_test/features/job/widgets/loading_widget.dart';

class JobListWidget extends StatefulWidget {
  const JobListWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<JobListWidget> createState() => _JobListWidgetState();
}

class _JobListWidgetState extends State<JobListWidget> {
  final TextEditingController _searchCont = TextEditingController();
  List<Job>? data = [];
  
  Future<void> _onRefresh(BuildContext context) async {
    _fetchRepoData();
  }
  
  @override
  void initState() {
     _fetchRepoData();
    super.initState();
  }


  @override
  void dispose() {
    data!.clear();
    super.dispose();
  }

  Future<void> _fetchRepoData() async {
    BlocProvider.of<JobRepoBloc>(context, listen: false)
        .add(JobListPaginatedEvent(keyWords: _searchCont.text));
  }

  Future<void> _naviagteToJobDetail(String id) async {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            GitReposIssuesListPage(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(),bottomNavigationBar: bottomNavigationBar,);
  }

  Widget _buildBody() {
    var moreData = context.watch<JobRepoBloc>().hasMoreData;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<JobRepoBloc, JobListState>(
          builder: (context, state) {
            if (state is JobListLoadingState) {
              return const LoadingWidget();
            }  
            else if (state is GetSearchRepoPaginatedErrorState) {
              return Center(child: Text(state.message));
            }
            else if (state is JobListPaginatedState){
            return _buildJobList(state.reposItem, moreData);
            }
            
            return const LoadingWidget();
          },
        ),
      ],
    );
  }

Widget _buildJobList(List<JobUI> data, bool moreData) {
    return Expanded(
      child: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: ReposLazyListWidget(
              data: data,
              loadMoreCallBack: () => _fetchRepoData(),
              onTapCallBack: (key) => _naviagteToJobDetail(key),
              hasMore: moreData,
              childType: JobUI)),
    );
  }


AppBar _buildAppBar() =>  AppBar(
        title: const Text('Jobs'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      );
}
 final BottomNavigationBar  bottomNavigationBar = BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      
    );

