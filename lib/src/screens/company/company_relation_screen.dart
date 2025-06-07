import 'package:flutter/material.dart';

class CompanyRelationScreen extends StatelessWidget {
  const CompanyRelationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Dữ liệu quan hệ công ty chưa được cập nhật",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }
}

class RelationItemWidget extends StatelessWidget {
  const RelationItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black54),
                ),
                Flexible(
                  child: Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Công ty TNHH MTV Cho thuê tài chính ngân hàng",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: null,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                      Text(
                        "CÔNG TY CON",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "Vốn điều lệ: 300 tỷ",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "Vốn góp: 300 tỷ",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "Tỷ lệ sở hữu: 100%",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            )),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
