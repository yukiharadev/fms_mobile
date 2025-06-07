import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../blocs/auth/user_info/user_info_bloc.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(UserInfoRequested());
  }

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
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserInfoSuccess) {
            // Handle the loaded state

            return ListView(
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
                            CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                child: Builder(
                                  builder: (_) {
                                    String? avatar = state.userInfoResponse.avatarUrl;
                                    if (avatar == null || avatar == "" || avatar == "string") {
                                      return CachedNetworkImage(
                                        imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                        fit: BoxFit.cover,
                                      );
                                    }
                                    return CachedNetworkImage(
                                      imageUrl: avatar,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.userInfoResponse.fullName ?? "Chưa cập nhật",
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
                        "Ngày sinh: ${state.userInfoResponse.birthDay}",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Giới tính: ${state.userInfoResponse.gender == 0 ? "Nữ" : "Nam"}",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Email: 01/11/2003",
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
            );
          } else if (state is UserInfoError) {
            return Center(
              child: Text(
                "Lỗi tải thông tin người dùng",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
          return Center(
            child: Text(
              "Không có dữ liệu",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
