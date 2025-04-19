import 'package:flutter/material.dart';

class CompanyLeadScreen extends StatelessWidget {
  const CompanyLeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hội đồng quản trị",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nguyễn Văn A",),
                        Text("Chức vụ: Giám đốc", style: TextStyle(fontSize: 11,)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey[400],)
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hội đồng quản trị",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nguyễn Văn A",),
                        Text("Chức vụ: Giám đốc", style: TextStyle(fontSize: 11,)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey[400],)
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hội đồng quản trị",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nguyễn Văn A",),
                        Text("Chức vụ: Giám đốc", style: TextStyle(fontSize: 11,)),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey[400],)
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
