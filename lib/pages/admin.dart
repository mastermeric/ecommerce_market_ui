import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go("AddPage");
        },
        label: const Text("Ekle"),
        ),
    );
  }
}