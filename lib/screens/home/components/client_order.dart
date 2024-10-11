import 'package:bir_qadam_pos/screens/home/components/order_card.dart';
import 'package:flutter/material.dart';
import '../../../models/models.dart';

class ClientOrderScreen extends StatefulWidget {
  final OrderModel order;
  const ClientOrderScreen({super.key, required this.order});

  @override
  State<ClientOrderScreen> createState() => _ClientOrderScreenState();
}

class _ClientOrderScreenState extends State<ClientOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrdersCardWidget(oredrsModel:widget.order )
      ],
    );
  }
}