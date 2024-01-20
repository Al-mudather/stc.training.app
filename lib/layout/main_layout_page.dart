import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stc_training/features/home/home_page.dart';

class MainLayoutPage extends HookWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Layout"),
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}
