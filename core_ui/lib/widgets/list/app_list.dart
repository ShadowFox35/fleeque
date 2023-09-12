import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets/list/app_list_item.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  final List<InfluencerEntity> influencerList;
  const AppList(this.influencerList, {super.key});

  @override
  State<StatefulWidget> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.influencerList.length,
      itemBuilder: (BuildContext context, int index) {
        final InfluencerEntity influencer = widget.influencerList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding_10),
          child: AppListItem(
            influencer: influencer,
          ),
        );
      },
    );
  }
}
