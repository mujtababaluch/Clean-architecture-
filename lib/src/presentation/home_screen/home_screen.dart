import 'package:clean_arch/src/presentation/home_screen/widget/home_screen_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: SafeArea(child: HomeScreenView()),
    );
  }
}