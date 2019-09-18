import 'package:flutter/widgets.dart';

class OnTapToUnfocus extends StatelessWidget {
  const OnTapToUnfocus({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
