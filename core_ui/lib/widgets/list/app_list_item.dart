import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AppListItem extends StatefulWidget {
  final InfluencerEntity influencer;

  const AppListItem({
    super.key,
    required this.influencer,
  });

  @override
  State<AppListItem> createState() => _AppListItemState();
}

class _AppListItemState extends State<AppListItem> {
  @override
  Widget build(BuildContext context) {
    final influencer = widget.influencer;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: AppDimens.padding_25),
          width: AppDimens.size_70,
          height: AppDimens.size_70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radius_10),
            child: Image.network(
              influencer.image,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: AppDimens.padding_5),
                child: Text(
                  influencer.name,
                  style: AppFonts.regularText,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "followers".toUpperCase(),
                        style: AppFonts.homeFollowers,
                      ),
                      Text("posts".toUpperCase(),
                          style: AppFonts.homeFollowers),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        influencer.followers,
                        style: AppFonts.homeFollowerAmount,
                      ),
                      Text(
                        '${influencer.posts}',
                        style: AppFonts.homeFollowerAmount,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
