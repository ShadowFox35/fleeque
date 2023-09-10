import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/home_list_item.dart';

class HomeList extends StatefulWidget {
  final List<InfluencerEntity> influencerList;
  const HomeList(this.influencerList, {super.key});

  @override
  State<StatefulWidget> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
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
          child: HomeListItem(
            influencer: influencer,
          ),
        );
      },
    );
  }
}
