import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Example
///
/// main.dart
///
/// Future<void> main() async {
///   runApp(
///     const ThemeSwitcherWidget(
///       initialThemeMode: ThemeMode.light,
///       child: App(),
///     ),
///   );
///
/// app.dart
///
/// class App extends StatelessWidget {
///   const App({key key}) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       thememode: ThemeSwitcher.of(context).themeMode,
///       home: home(),
///     );
///   }
/// }
///
/// Changeed App Theme
/// Called to switchTheme(bool val)
///
/// Example
/// onChanged: (bool val) => ThemeSwitcher.of(context).switchTheme(val),
///
class ThemeSwitcher extends InheritedWidget {
  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final _ThemeSwitcherWidgetState data;
  static _ThemeSwitcherWidgetState of(BuildContext context) {
    final ThemeSwitcher _themeswitcher =
        context.inheritFromWidgetOfExactType(ThemeSwitcher);
    return _themeswitcher.data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) => this != oldWidget;
}

class ThemeSwitcherWidget extends StatefulWidget {
  const ThemeSwitcherWidget({
    Key key,
    @required this.child,
    @required this.initialThemeMode,
  })  : assert(child != null),
        assert(initialThemeMode != null),
        super(key: key);

  final Widget child;
  final ThemeMode initialThemeMode;

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ThemeMode themeMode = ThemeMode.light;
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    loadAppTheme();
  }

  Future<void> loadAppTheme() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('isDark') == null) {
      // 初回起動は端末のテーマ情報を取得しアプリに適用する
      final Brightness platformBrightness =
          MediaQuery.platformBrightnessOf(context);
      switchTheme(platformBrightness == Brightness.dark ? true : false);
    } else {
      setState(() {
        isDark = prefs.getBool('isDark');
        themeMode = prefs.getBool('isDark') ? ThemeMode.dark : ThemeMode.light;
      });
    }
  }

  Future<void> switchTheme(bool val) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isDark', val);
    setState(() {
      isDark = val;
      themeMode = val ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    themeMode = themeMode ?? widget.initialThemeMode;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}
