import 'package:flutter/material.dart';
import 'package:stopover_app/styles.dart';

class DefaultAppBar extends AppBar {
  @override
  Widget get title => Text(
        "Emirates Stopover".toUpperCase(),
        style: Styles.navBarTitle,
      );

  @override
  IconThemeData get iconTheme => IconThemeData(color: Colors.white);

  @override
  Color get backgroundColor => Colors.red;

  @override
  double get elevation => 0.5;
}
