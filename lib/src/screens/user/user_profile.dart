import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin người dùng",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/profile/bg-profile.jpg",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                cacheHeight: 150,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.grey[200],
                    );
                  }
                  return child;
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(child: Text("Lỗi tải ảnh")),
                  );
                },
              ),
              Transform.translate(
                offset: Offset(0, 85),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            )),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          maxRadius: 50,
                          minRadius: 45,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nguyễn Việt Hoàng",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Yukihara",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75,
                ),
                Divider(
                  color: Colors.grey[300],
                  height: 1,
                ),
                Text(
                  "Thông tin cá nhân",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ngày sinh: 01/11/2003",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Giới tính: Nam",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Email: ",
                  style: TextStyle(fontSize: 13),
                ),
                Divider(
                  color: Colors.grey[300],
                  height: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Danh sách bài đăng",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Center(
                          child: Text(
                        "Tính năng đăng bài đang được phát triển",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
