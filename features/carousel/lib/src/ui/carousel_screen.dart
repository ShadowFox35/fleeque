import 'package:carousel/src/ui/carousel_form.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:carousel/src/bloc/carousel_bloc.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CarouselBloc(),
      child: BlocBuilder<CarouselBloc, CarouselState>(
        builder: (BuildContext context, CarouselState state) {
          return const CarouselForm();
        },
      ),
    );
  }
}
