import 'package:flutter/material.dart';

class OffstageWidget extends StatelessWidget {
  const OffstageWidget({
    Key key,
    @required this.index,
    @required this.selectIndex,
    @required this.child,
  })  : assert(index != null),
        assert(selectIndex != null),
        assert(child != null),
        super(key: key);

  final int index;
  final int selectIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: selectIndex != index,
      child: TickerMode(
        enabled: selectIndex == index,
        child: child,
      ),
    );
  }
}
