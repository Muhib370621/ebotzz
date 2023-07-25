// ignore_for_file: file_names

import '../utils/imports.dart';

Image assetImage(
  String path, {
  double? width,
  double? height,
  BoxFit? fit,
  Color? color,
}) {
  return Image.asset(
    path,
    width: width,
    height: height,
    fit: fit,
    color: color,
  );
}

Image networkImage(
  String path, {
  double? width,
  double? height,
  BoxFit? fit,
  Color? color,
}) {
  return Image.network(
    path,
    width: width,
    height: height,
    fit: fit,
    color: color,
  );
}
