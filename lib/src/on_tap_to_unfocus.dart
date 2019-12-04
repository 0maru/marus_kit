import 'dart:async';

import 'package:flutter/widgets.dart';

class OnTapToUnfocus extends StatelessWidget {
  const OnTapToUnfocus({
    Key key,
    @required this.child,
    this.androidPrevButton = false,
    this.onWillPop,
  })  : assert(child != null),
        super(key: key);

  final Widget child;
  final bool androidPrevButton;
  final WillPopCallback onWillPop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: _buildWillPopScope(context),
    );
  }

  Widget _buildWillPopScope(BuildContext context) {
    if (!androidPrevButton) {
      return child;
    }
    return WillPopScope(
      onWillPop: onWillPop,
      child: child,
    );
  }
}
