import 'package:flutter/material.dart';

class GroupSearchView extends StatelessWidget {
  const GroupSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Groups'),
      ),
      body: const Center(
        child: Text('Search Groups'),
      ),
    );
  }
}
