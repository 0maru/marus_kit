import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Gridの幅の作り方を変える
/// CrossAxisCountをもとに作るべき
class ValiableGrid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ValiableGridState();
}

class _ValiableGridState extends State<ValiableGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('valiableGrid'),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
