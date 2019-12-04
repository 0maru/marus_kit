import 'package:flutter/material.dart';
import './base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  const BlocProvider({
    @required this.child,
    @required this.bloc,
    Key key,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  static T of<T extends BaseBloc>(BuildContext context) {
    final _Inherited<T> inherited = context.dependOnInheritedWidgetOfExactType(
      aspect: _typeOf<_Inherited<T>>(),
    );
    return inherited.bloc;
  }

  static Type _typeOf<T>() => T;

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends BaseBloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) => _Inherited<T>(
        bloc: widget.bloc,
        child: widget.child,
      );

  @override
  void didUpdateWidget(BlocProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bloc != widget.bloc) {
      oldWidget.bloc.dispose();
    }
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class _Inherited<T extends BaseBloc> extends InheritedWidget {
  const _Inherited({
    @required Widget child,
    @required this.bloc,
    Key key,
  }) : super(
          key: key,
          child: child,
        );

  final T bloc;

  @override
  bool updateShouldNotify(_Inherited old) => old.bloc != bloc;
}
