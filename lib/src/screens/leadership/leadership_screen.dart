import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LeadershipScreen extends StatelessWidget {
  final String personId;
  final String leaderName;
  const LeadershipScreen({super.key, required this.personId, required this.leaderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  CachedNetworkImage(imageUrl: "https://picsum.photos/150/200"),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leaderName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                      Text(
                        "Ngày sinh",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                      Text(
                        "Thường trú",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                      Text(
                        "Tạm trú",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Lịch sử công tác",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  fontFamily: "SFProDisplay",
                ),
              ),
              Text(
                "Chức vụ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  fontFamily: "SFProDisplay",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
