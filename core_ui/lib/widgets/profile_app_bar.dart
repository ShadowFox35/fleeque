import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text('Back'),
            ],
          ),
          Text(
            AppConstants.profileTitle,
            style: AppFonts.regularTextWhite,
          ),
          // Text('Settings'),
          IconButton(
            icon: SvgPicture.asset(
              ImagePaths.informationIcon,
            ),
            onPressed: () => {null},
          ),
        ],
      ),
    );
  }
}
