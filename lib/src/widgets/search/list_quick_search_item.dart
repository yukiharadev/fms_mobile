import 'package:flutter/material.dart';

class ListQuickSearchItem extends StatelessWidget {
  const ListQuickSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HPG",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff03307a)),
              ),
              Text(
                "Công ty cổ phần Tập đoàn Hòa Phát",
                style: TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
          Icon(Icons.star)
        ],
      ),
    );
  }
}
