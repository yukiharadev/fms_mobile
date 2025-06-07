import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/ceo/work/get_work_bloc.dart';

import '../../blocs/ceo/info/person_info_bloc.dart';

class LeadershipScreen extends StatefulWidget {
  final String personId;
  final String leaderName;
  const LeadershipScreen({super.key, required this.personId, required this.leaderName});

  @override
  State<LeadershipScreen> createState() => _LeadershipScreenState();
}

class _LeadershipScreenState extends State<LeadershipScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PersonInfoBloc>().add(PersonInfoLoadEvent(widget.personId));
    context.read<GetWorkBloc>().add(GetWorkLoadEvent(personId: widget.personId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: BlocBuilder<PersonInfoBloc, PersonInfoState>(builder: (context, state) {
            if (state is PersonInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PersonInfoError) {
              return Center(child: Text("Lỗi: ${state.message}"));
            } else if (state is PersonInfoSuccess) {
              return Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.personInfoResponse.avatarUrl ?? '',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.leaderName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              fontFamily: "SFProDisplay",
                            ),
                          ),
                          Text(
                            "Ngày sinh ${state.personInfoResponse.birthDay ?? 'N/A'}",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SFProDisplay",
                            ),
                          ),
                          Text(
                            "Thường trú: ${state.personInfoResponse.address ?? 'N/A'}",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SFProDisplay",
                            ),
                          ),
                          Text(
                            "Tạm trú ${state.personInfoResponse.residence ?? 'N/A'}",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SFProDisplay",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lịch sử công tác",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.personInfoResponse.description ?? 'Chưa có thông tin',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "SFProDisplay",
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<GetWorkBloc, GetWorkState>(
                    builder: (context, state) {
                      if (state is GetWorkLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetWorkError) {
                        return Center(child: Text("Lỗi: ${state.message}"));
                      } else if (state is GetWorkSuccess) {
                        if (state.workResponse.companies.isEmpty) {
                          return Center(child: Text("Chưa có công việc nào"));
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Công việc",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  fontFamily: "SFProDisplay",
                                ),
                              ),
                              const SizedBox(height: 8),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.workResponse.companies.length,
                                itemBuilder: (context, index) {
                                  final company = state.workResponse.companies[index];
                                  return Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              company.companyName ?? 'N/A',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              company.position ?? 'N/A',
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(company.symbol ?? 'N/A',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]


                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              );
            } else {
              return Center(child: Text("Unknown state"));
            }
          }),
        ),
      ),
    );
  }
}
