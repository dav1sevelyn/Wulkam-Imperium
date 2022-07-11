/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/atmactive.png
  AssetGenImage get atmactive =>
      const AssetGenImage('assets/images/atmactive.png');

  /// File path: assets/images/atminactive.png
  AssetGenImage get atminactive =>
      const AssetGenImage('assets/images/atminactive.png');

  /// File path: assets/images/bg.png
  AssetGenImage get bgPng => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/bg.svg
  SvgGenImage get bgSvg => const SvgGenImage('assets/images/bg.svg');

  /// File path: assets/images/boost.svg
  SvgGenImage get boost => const SvgGenImage('assets/images/boost.svg');

  /// File path: assets/images/busic.png
  AssetGenImage get busic => const AssetGenImage('assets/images/busic.png');

  /// File path: assets/images/cat.png
  AssetGenImage get cat => const AssetGenImage('assets/images/cat.png');

  /// File path: assets/images/check.svg
  SvgGenImage get check => const SvgGenImage('assets/images/check.svg');

  /// File path: assets/images/clear.svg
  SvgGenImage get clear => const SvgGenImage('assets/images/clear.svg');

  /// File path: assets/images/coin.svg
  SvgGenImage get coin => const SvgGenImage('assets/images/coin.svg');

  /// File path: assets/images/dollar.png
  AssetGenImage get dollar => const AssetGenImage('assets/images/dollar.png');

  /// File path: assets/images/fortuneactive.png
  AssetGenImage get fortuneactive =>
      const AssetGenImage('assets/images/fortuneactive.png');

  /// File path: assets/images/fortuneinactive.png
  AssetGenImage get fortuneinactive =>
      const AssetGenImage('assets/images/fortuneinactive.png');

  /// File path: assets/images/jackpot.png
  AssetGenImage get jackpot => const AssetGenImage('assets/images/jackpot.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/loose.png
  AssetGenImage get loose => const AssetGenImage('assets/images/loose.png');

  /// File path: assets/images/phoneactive.png
  AssetGenImage get phoneactive =>
      const AssetGenImage('assets/images/phoneactive.png');

  /// File path: assets/images/phoneinactive.png
  AssetGenImage get phoneinactive =>
      const AssetGenImage('assets/images/phoneinactive.png');

  /// File path: assets/images/pirat.png
  AssetGenImage get pirat => const AssetGenImage('assets/images/pirat.png');

  /// File path: assets/images/question.svg
  SvgGenImage get question => const SvgGenImage('assets/images/question.svg');

  /// File path: assets/images/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/images/settings.svg');

  /// File path: assets/images/spin.png
  AssetGenImage get spin => const AssetGenImage('assets/images/spin.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// File path: assets/images/store.svg
  SvgGenImage get store => const SvgGenImage('assets/images/store.svg');

  /// File path: assets/images/suitactive.png
  AssetGenImage get suitactive =>
      const AssetGenImage('assets/images/suitactive.png');

  /// File path: assets/images/suitinactive.png
  AssetGenImage get suitinactive =>
      const AssetGenImage('assets/images/suitinactive.png');

  /// File path: assets/images/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/images/sun.png');

  /// File path: assets/images/sunglasses.png
  AssetGenImage get sunglasses =>
      const AssetGenImage('assets/images/sunglasses.png');

  /// File path: assets/images/sunglassesactive.png
  AssetGenImage get sunglassesactive =>
      const AssetGenImage('assets/images/sunglassesactive.png');

  /// File path: assets/images/sunglassesinactive.png
  AssetGenImage get sunglassesinactive =>
      const AssetGenImage('assets/images/sunglassesinactive.png');

  /// File path: assets/images/win.png
  AssetGenImage get win => const AssetGenImage('assets/images/win.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;
}
