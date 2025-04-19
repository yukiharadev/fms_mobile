import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/src/configs/constants.dart';
import 'package:my_app/src/widgets/home/table_company_widget.dart';

import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(
          Constants.logo,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  spacing: 3,
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: Text(
                        "Tìm kiếm mã hoặc tên công ty",
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                )),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.black12,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Text(
                      "Top 10 công ty",
                      style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.combine([TextDecoration.underline]), fontSize: 14),
                    ),
                  ),
                  TableCompanyWidget()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Text(
                      "VN30",
                      style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.combine([TextDecoration.underline]), fontSize: 14),
                    ),
                  ),
                  TableCompanyWidget()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
