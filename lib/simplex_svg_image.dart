import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimplexSvgImage extends StatelessWidget {
  SimplexSvgImage(
    String url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.colorFilter,
    this.setColorFilter = false,
  }) : child = SvgPicture.asset(
         url,
         width: width,
         height: height,
         fit: fit,
         colorFilter: setColorFilter
             ? ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn)
             : colorFilter,
       );

  final double? width;
  final double? height;
  final BoxFit fit;
  final bool setColorFilter;
  final Color? color;
  final ColorFilter? colorFilter;
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
