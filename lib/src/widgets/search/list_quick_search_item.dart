import 'package:flutter/material.dart';
import 'package:my_app/src/models/company/response/company_overview_response.dart';
import 'package:my_app/src/screens/company/company_screen.dart';

class ListQuickSearchItem extends StatelessWidget {
  final CompanyDetailResponse response;
  const ListQuickSearchItem({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CompanyScreen(
            symbol: response.symbol!,
            companyName: response.companyName!,
          ),
        ));
      },
      child: Container(
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
                  response.symbol!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff03307a)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    response.companyName!,
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Icon(Icons.star)
          ],
        ),
      ),
    );
  }
}
