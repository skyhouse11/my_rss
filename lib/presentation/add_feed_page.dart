import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddFeedPage extends StatelessWidget {
  const AddFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Feed')),
      body: const Center(child: Text('Add feed form')),
    );
  }
}
