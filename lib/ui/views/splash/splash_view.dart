import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../app/route/app_router.gr.dart';
import 'package:grock/grock.dart';

import '../../../assets.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static final ValueNotifier<double> blurValueNotifier =
      ValueNotifier<double>(0.0);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double blurValueNotifier = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        2.seconds,
        () => context.router
            .replace(const BaseRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GrockScaleAnimation(
              duration: 2.seconds,
              end: 4,
              addListener: (controller) =>
                  setState(() => blurValueNotifier = controller.value * 15),
              child: _imageFilterWidget())
          .center,
    );
  }

  ImageFiltered _imageFilterWidget() {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
          sigmaX: blurValueNotifier, sigmaY: blurValueNotifier),
      child: _imageWidget().animatedRotation(duration: 2.seconds),
    );
  }

  Image _imageWidget() => Image.asset(Assets.image.imPokemonPNG);
}
