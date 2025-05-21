import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/models/auth/response/user_info_response.dart';

import '../../screens/user/user_profile.dart';

class ProfileWidget extends StatelessWidget {
  final UserInfoResponse userInfoResponse;
  const ProfileWidget({super.key, required this.userInfoResponse});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserProfile(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: ClipOval(
                  child: Builder(
                    builder: (_) {
                      String? avatar = userInfoResponse.avatarUrl;
                      if (avatar == null || avatar == "string") {
                        return CachedNetworkImage(
                          imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        );
                      }
                      return CachedNetworkImage(
                        imageUrl: avatar,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      );
                    },
                  ),
                ),
              ),
            ),

            Text(
              userInfoResponse.fullName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
