import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/issues/presentation/ui/git_repo_issues.dart';
import 'package:on_run_test/features/search/data/datamodels/searchrepo/search_repo.dart';
import 'package:on_run_test/features/search/presentation/bloc/search_repo_bloc.dart';
import 'package:on_run_test/features/search/presentation/bloc/search_repo_events.dart';
import 'package:on_run_test/features/search/presentation/bloc/search_repo_states.dart';
import 'package:on_run_test/features/search/widgets/lazy_list.dart';
import 'package:on_run_test/features/search/widgets/loading_widget.dart';

class GitReposListPage extends StatefulWidget {
  const GitReposListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<GitReposListPage> createState() => _GitReposListPageState();
}

class _GitReposListPageState extends State<GitReposListPage> {
  final TextEditingController _searchCont = TextEditingController();

  Future<void> _onRefresh(BuildContext context) async {
    // context.read<SearchRepoBloc>().repos.clear();
    BlocProvider.of<SearchRepoBloc>(context, listen: false)
        .add(const SearchRepoInitialEvent());
    _loadRepo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadRepo() async {
    BlocProvider.of<SearchRepoBloc>(context, listen: false)
        .add(SearchRepoPaginatedEvent(keyWords: _searchCont.text));
  }

  Future<void> _clearBloc() async {
    BlocProvider.of<SearchRepoBloc>(context, listen: false)
        .add(const SearchRepoInitialEvent());
  }

  Future<void> _naviagteToIssue(String fullName) async {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            GitReposIssuesListPage(fullName: fullName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchFieldWidget(),
        BlocBuilder<SearchRepoBloc, SearchRepoState>(
          builder: (context, state) {
            if (state is GetSearchRepoLoadingState &&
                context.read<SearchRepoBloc>().repos.isEmpty) {
              return const LoadingWidget();
            } else if (state is GetSearchRepoPaginatedState) {
              return Expanded(
                child: RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    child: ReposLazyListWidget(
                        data: state.reposItem
                            .items!, //context.watch<SearchRepoBloc>().repos,
                        loadMoreCallBack: _loadRepo,
                        onTapCallBack: (key) => _naviagteToIssue,
                        hasMore:
                            false, //context.read<SearchRepoBloc>().hasMoreData,
                        childType: Repos)),
              );
            } else if (state is GetSearchRepoPaginatedErrorState &&
                context.read<SearchRepoBloc>().repos.isEmpty) {
              return const Center(child: Text("Error while loading."));
            }
            return Container();
            // return Expanded(
            //   child: RefreshIndicator(
            //       onRefresh: () => _onRefresh(context),
            //       child: ReposLazyListWidget(
            //           data:  context.read<SearchRepoBloc>().repos,
            //           loadMoreCallBack: _loadRepo,
            //           childType: Repos,
            //           hasMore:
            //               true, //context.read<SearchRepoBloc>().hasMoreData,
            //           onTapCallBack: _naviagteToIssue)),
            // );
          },
        ),
      ],
    );
  }

  Widget _buildSearchFieldWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          if (value.length == 4) {
            log("start search");
            FocusScope.of(context).unfocus();
            _clearBloc();
            _loadRepo();
          }
        },
        controller: _searchCont,
        maxLength: 4,
        decoration: const InputDecoration(
            labelText: "Search",
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text('Git Repo'));
}
