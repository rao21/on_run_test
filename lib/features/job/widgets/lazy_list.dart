import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:on_run_test/features/job/presentation/ui/job_ui_model.dart';
import 'package:on_run_test/features/job/widgets/job_card.dart';

class ReposLazyListWidget extends StatelessWidget {
  final List<dynamic> data;
  final ScrollController _scrollController = ScrollController();
  final Function loadMoreCallBack;
  final Function(String) onTapCallBack;
  final Type childType;
  final bool hasMore;
  ReposLazyListWidget(
      {Key? key,
      required this.data,
      required this.loadMoreCallBack,
      required this.onTapCallBack,
      required this.childType,
      required this.hasMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(
        child: Text('No Data found'),
      );
    }

    return ListView.builder(
        controller: _scrollController
          ..addListener(() {
            if (_scrollController.offset ==
                _scrollController.position.maxScrollExtent) {
              log("Racehd at max");
              loadMoreCallBack();
            }
          }),
        itemCount: data.length,
        itemBuilder: (cnt, i) {
          if (data.length - 1 == i && hasMore) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (childType == JobUI) {
            var obj = data[i];
            return JobCard(job: obj,key: ValueKey(obj.id,));            
          }
          
          return Container();
        });
  }
}
