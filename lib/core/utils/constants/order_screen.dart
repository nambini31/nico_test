import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const String routename = "/order";
  final BuildContext? controllerContext;

  const OrderScreen({super.key, this.controllerContext});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order page"),
      ),
    );
  }
}
