import 'package:bir_qadam_pos/screens/home/components/clients_part.dart';
import 'package:bir_qadam_pos/screens/home/components/order_card.dart';
import 'package:flutter/material.dart';
import '../../../core/core.dart';

class HomeClientsScreen extends StatefulWidget {
  const HomeClientsScreen({super.key});
  @override
  State<HomeClientsScreen> createState() => _HomeClientsScreenState();
}

class _HomeClientsScreenState extends State<HomeClientsScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.77,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 0.sp),
        child: const Column(
          children: [
            ClientsPart(),
            OrdersCardWidget(),
          ],
        ),
      ),
    );
  }
}
