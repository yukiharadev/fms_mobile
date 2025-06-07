import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/user_info/user_info_bloc.dart';
import '../../screens/user/user_profile.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(UserInfoRequested());
  }

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
        child: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }
            if (state is UserInfoError) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Text(
                    "Error loading user info",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }
            if (state is UserInfoSuccess) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: Builder(
                          builder: (_) {
                            String? avatar = state.userInfoResponse.avatarUrl;
                            if (avatar == null || avatar == "" || avatar == "string") {
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
                    state.userInfoResponse.fullName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
