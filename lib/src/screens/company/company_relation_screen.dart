import 'package:flutter/material.dart';

class CompanyRelationScreen extends StatelessWidget {
  const CompanyRelationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
              children: [
                Text("1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black54
                  ),
                ),
                Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Công ty TNHH MTV Cho thuê tài chính ngân hàng", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("CÔNG TY CON", style: TextStyle(fontSize: 10),),
                    Text("Vốn điều lệ: 300 tỷ", style: TextStyle(fontSize: 10),),
                    Text("Vốn góp: 300 tỷ", style: TextStyle(fontSize: 10),),
                    Text("Tỷ lệ sở hữu: 100%", style: TextStyle(fontSize: 10),),
                  ],
                )
              ],
              )
              ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text("1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black54
                      ),
                    ),
                    Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Công ty TNHH MTV Cho thuê tài chính ngân hàng", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("CÔNG TY CON", style: TextStyle(fontSize: 10),),
                        Text("Vốn điều lệ: 300 tỷ", style: TextStyle(fontSize: 10),),
                        Text("Vốn góp: 300 tỷ", style: TextStyle(fontSize: 10),),
                        Text("Tỷ lệ sở hữu: 100%", style: TextStyle(fontSize: 10),),
                      ],
                    )
                  ],
                )
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(16),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text("1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black54
                      ),
                    ),
                    Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Công ty TNHH MTV Cho thuê tài chính ngân hàng", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("CÔNG TY CON", style: TextStyle(fontSize: 10),),
                        Text("Vốn điều lệ: 300 tỷ", style: TextStyle(fontSize: 10),),
                        Text("Vốn góp: 300 tỷ", style: TextStyle(fontSize: 10),),
                        Text("Tỷ lệ sở hữu: 100%", style: TextStyle(fontSize: 10),),
                      ],
                    )
                  ],
                )
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ),
      ],
    );
  }
}
