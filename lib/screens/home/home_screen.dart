import 'package:bir_qadam_pos/screens/home/components/home_appbar.dart';
import 'package:flutter/material.dart';
import 'components/home_clients.dart';
import 'components/search_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HomeAppBar(),
          HomeSearchPart(),
          HomeClientsScreen(),
        ],
      ),
    );
  }
}
