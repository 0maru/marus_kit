import 'package:flutter/widgets.dart';

class OnTapToUnfocus extends StatelessWidget {
  const OnTapToUnfocus({
    Key key,
    this.androidPrevButton = false,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;
  final bool androidPrevButton;

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
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: child,
    );
  }
}
