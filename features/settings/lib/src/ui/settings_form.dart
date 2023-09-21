import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/bloc/settings_bloc.dart';

class SettingsForm extends StatelessWidget {
  SettingsForm({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _instNameController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  Future<File> pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final image = File(returnedImage!.path);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
        _nameController.text = state.userInfo.name;
        _emailController.text = state.userInfo.email;
        _numberController.text = state.userInfo.number;
        _instNameController.text = state.userInfo.instagram;
        _bankController.text = state.userInfo.bank;

        return SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_25,
              vertical: AppDimens.padding_15,
            ),
            child: ListView(
              shrinkWrap: true,
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
                      if (state.imageUrl != null) {
                        return SizedBox(
                          width: AppDimens.size_130,
                          height: AppDimens.size_130,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.radius_100),
                            child: Image.network(
                              state.imageUrl!,
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
                    Container(
                      padding: const EdgeInsets.only(top: AppDimens.padding_20),
                      child: GestureDetector(
                        onTap: () async {
                          BlocProvider.of<SettingsBloc>(context).add(
                            PickImageEvent(await pickImageFromGallery()),
                          );
                        },
                        child: Text(
                          AppConstants.addProfilePicture.toUpperCase(),
                          style: AppFonts.addProfilePictureText,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: AppDimens.padding_20),
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<SettingsBloc>(context).add(
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
                InputField(
                  labelText: AppConstants.settingsLabelName,
                  controller: _nameController,
                ),
                InputField(
                  labelText: AppConstants.settingsLabelEmail,
                  controller: _emailController,
                ),
                InputField(
                  labelText: AppConstants.settingsLabelNumber,
                  controller: _numberController,
                ),
                InputField(
                  labelText: AppConstants.settingsLabelInstName,
                  controller: _instNameController,
                ),
                InputField(
                  labelText: AppConstants.settingsLabelBank,
                  controller: _bankController,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<SettingsBloc>(context).add(
                      AddInfoEvent(
                        userInfo: UserEntity(
                            name: _nameController.text,
                            email: _emailController.text,
                            number: _numberController.text,
                            instagram: _instNameController.text,
                            bank: _bankController.text),
                      ),
                    );
                  },
                  child: AppButton(
                      buttonText: AppConstants.settingsButtonSave,
                      buttonWidth: AppDimens.size_340,
                      buttonColor: AppColors.black,
                      buttonFontStyle: AppFonts.buttonBlack),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
