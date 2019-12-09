import 'package:flutter/material.dart';

class RestartApp extends StatefulWidget {
  const RestartApp({
    this.child,
  });

  final Widget child;

  static restartApp(BuildContext context) {
    final _RestartAppState state =
        context.ancestorStateOfType(const TypeMatcher<_RestartAppState>());
    state.restartApp();
  }

  State<StatefulWidget> createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  Widget build(BuildContext context) => Container(
        key: key,
        child: widget.child,
      );
}
