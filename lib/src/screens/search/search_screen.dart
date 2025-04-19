import 'package:flutter/material.dart';
import 'package:my_app/src/widgets/search/list_quick_search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: "Tìm kiếm mã hoặc tên công ty",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                      ),
                    )),
                  ],
                )),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(4, (index) {
                List<String> labels = ["Tất cả", "Công ty/Mã CK", "Lãnh đạo", "Tin tức"];
                return InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.15,
                      ),
                      color: activeIndex == index ? Colors.blue[900] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyle(color: activeIndex == index ? Colors.white : Color(0xff03307a), fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                );
              }),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.black12,
                  child: Text(
                    "Tìm kiếm phổ biến",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListQuickSearchItem(),
                ListQuickSearchItem(),
                ListQuickSearchItem(),
                ListQuickSearchItem(),
                ListQuickSearchItem(),
              ],
            )
          ],
        ));
  }
}
