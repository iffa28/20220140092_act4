import 'package:flutter/material.dart';
import 'package:navigation_routing_parsingparameter/detail_order_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;
    
    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter food name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter drink name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMakananController,
              decoration: const InputDecoration(labelText: 'Qty of Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yout qty of food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMinumanController,
              decoration: const InputDecoration(labelText: 'Qty of Drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yout qty of drink order';
                }
                return null;
              },
            ),
            
          ]
        ),
      ),
    );
  }
}