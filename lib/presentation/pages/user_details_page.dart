import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserDetailsPage extends StatelessWidget {
  final UserController userController = Get.find();

  UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int userId = (ModalRoute.of(context)?.settings.arguments ?? 0) as int;
    final user = userController.users.firstWhere((user) => user['id'] == userId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
            ),
            const SizedBox(height: 16.0),
            Text('ID: ${user['id']}'),
            Text('Name: ${user['first_name']} ${user['last_name']}'),
            Text('Email: ${user['email']}'),
          ],
        ),
      ),
    );
  }
}
