import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(children: [Text("ADMIN PAKEL...")],),
        Row(children: [Text("ADMIN ISLEMLERI.....")],)
      ],
    );
  }
}