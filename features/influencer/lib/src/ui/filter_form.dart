import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:influencer/src/bloc/influencer_bloc.dart';

class FilterForm extends StatelessWidget {
  final List<InfluencerEntity> influencerList;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _popularityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  FilterForm(this.influencerList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text('Back'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<InfluencersBloc, InfluencersState>(
          builder: (BuildContext context, InfluencersState state) {
        return SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.padding_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort by',
                  style: AppFonts.titleWhite,
                ),
                InputField(
                  controller: _priceController,
                  labelText: 'price',
                  isWhite: true,
                ),
                Text(
                  'Select',
                  style: AppFonts.underlinedText,
                ),
                InputField(
                  controller: _timeController,
                  labelText: 'time',
                  isWhite: true,
                ),
                Text(
                  'Newest',
                  style: AppFonts.underlinedText,
                ),
                InputField(
                  controller: _popularityController,
                  labelText: 'popularity',
                  isWhite: true,
                ),
                Text(
                  '> 1m followers',
                  style: AppFonts.underlinedText,
                ),
                InputField(
                  controller: _countryController,
                  labelText: 'country',
                  isWhite: true,
                ),
                Text(
                  'France',
                  style: AppFonts.underlinedText,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<InfluencersBloc>(context).add(
                      FilterEvent(
                        request: FilterEntity(
                          country: _countryController.text,
                          price: int.tryParse(_priceController.text) ?? 100,
                          time: _timeController.text,
                          followers: int.tryParse(_popularityController.text) ??
                              1000000,
                        ),
                      ),
                    );
                  },
                  child: AppButton(
                    buttonText: 'Search...',
                    buttonWidth: AppDimens.size_340,
                    buttonColor: AppColors.black,
                    buttonTextColor: AppFonts.buttonBlack,
                    isBordered: true,
                  ),
                ),
                AppButton(
                  buttonText: 'filter',
                  buttonWidth: AppDimens.size_340,
                  buttonColor: AppColors.white,
                  buttonTextColor: AppFonts.buttonWhite,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
