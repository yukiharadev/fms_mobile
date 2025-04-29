import 'package:flutter/material.dart';

class LeadershipScreen extends StatelessWidget {
  final String personId;
  final String leaderName;
  const LeadershipScreen({super.key, required this.personId, required this.leaderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(leaderName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text("Leadership details for $leaderName with ID: $personId"),
      ),
    );
  }
}
