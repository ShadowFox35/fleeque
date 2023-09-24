import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/bloc/profile_bloc.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  static List<String> items = [
    AppConstants.profileListDonate,
    AppConstants.profileListSettings,
    AppConstants.profileListOrders,
    AppConstants.profileCreateOffer,
    AppConstants.profileListContact,
    AppConstants.profileListSupport,
  ];

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
        return SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_25,
              vertical: AppDimens.padding_15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Builder(builder: (context) {
                      if (state.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).focusColor),
                          ),
                        );
                      }
                      if (state.userInfo.imageUrl != '') {
                        return SizedBox(
                          width: AppDimens.size_130,
                          height: AppDimens.size_130,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.radius_100),
                            child: Image.network(
                              state.userInfo.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                      return Container(
                        alignment: Alignment.center,
                        width: AppDimens.size_130,
                        height: AppDimens.size_130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.black,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppDimens.radius_100),
                        ),
                      );
                    }),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: AppDimens.size_130,
                    //   height: AppDimens.size_130,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: AppColors.black,
                    //     ),
                    //     borderRadius:
                    //         BorderRadius.circular(AppDimens.radius_100),
                    //   ),
                    //   child: Text(
                    //     AppConstants.addProfilePicture.toUpperCase(),
                    //     style: AppFonts.addProfilePictureText,
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.only(top: AppDimens.padding_20),
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<ProfileBloc>(context).add(
                            SignOutEvent(),
                          );
                        },
                        child: Text(
                          AppConstants.logOut,
                          style: AppFonts.skipText,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: AppDimens.padding_30),
                      child: Column(
                        children: [
                          Text(
                            AppConstants.hello.toUpperCase(),
                            style: AppFonts.labelText,
                          ),
                          Text(
                            state.userInfo.name,
                            style: AppFonts.title,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfileForm.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String item = ProfileForm.items[index];
                      return ListTile(
                        title: GestureDetector(
                          onTap: () {
                            BlocProvider.of<ProfileBloc>(context).add(
                              NavigateEvent(path: ProfileForm.items[index]),
                            );
                          },
                          child: Text(
                            item,
                            style: AppFonts.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
