import 'package:flutter/material.dart';

class CompanyFinanceReportScreen extends StatelessWidget {
  const CompanyFinanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Text("Kết quả KD",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54
              ),
            ),
            Text("Cân đối KT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54
              ),
            ),
            Text("LC Tiền tệ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54
              ),
            ),
          ],
        )
      ],
    );
  }
}
