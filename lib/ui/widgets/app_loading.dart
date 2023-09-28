import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import '../../assets.dart';

class AppLoading {
  static show() {
    Grock.dialog(
      barrierDismissible: false,
      builder: (context) {
        return const _AppLoadingView();
      },
    );
  }

  static hide() {
    Grock.back();
  }

  static view() => const _AppLoadingView();
}

class _AppLoadingView extends StatefulWidget {
  const _AppLoadingView();

  @override
  State<_AppLoadingView> createState() => _AppLoadingViewState();
}

class _AppLoadingViewState extends State<_AppLoadingView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  void init() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn);
    _controller!.repeat();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Center(
        child: RotationTransition(
          turns: _animation!,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(Assets.image.imPokemonPNG,
                width: context.width * 0.2, height: context.width * 0.2),
          ),
        ),
      ),
    );
  }
}
