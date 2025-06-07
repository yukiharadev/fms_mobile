import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/company/company_leadership/company_leadership_bloc.dart';
import 'package:my_app/src/models/company/response/company_leadership_response.dart';
import 'package:my_app/src/screens/leadership/leadership_screen.dart';

class CompanyLeadScreen extends StatefulWidget {
  final String companyId;

  const CompanyLeadScreen({super.key, required this.companyId});

  @override
  State<CompanyLeadScreen> createState() => _CompanyLeadScreenState();
}

class _CompanyLeadScreenState extends State<CompanyLeadScreen> {
  static const Map<String, String> _departmentMapping = {
    'BoardOfDirectors': 'Hội đồng quản trị',
    'ExecutiveBoardOrChiefAccountant': 'Ban giám đốc/Kế toán trưởng',
    'AuditCommittee': 'Ban kiểm toán',
    'Others': 'Khác',
  };

  @override
  void initState() {
    super.initState();
    context.read<CompanyLeadershipBloc>().add(GetCompanyLeadership(companyId: widget.companyId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyLeadershipBloc, CompanyLeadershipState>(
      builder: (context, state) {
        if (state is CompanyLeadershipLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CompanyLeadershipError) {
          return Center(child: Text("Error: ${state.error}"));
        }
        if (state is CompanyLeadershipSuccess) {
          if (state.response.isEmpty) {
            return const Center(child: Text("Không có dữ liệu lãnh đạo"));
          }
          return ListView.builder(
            itemCount: state.response.length,
            itemBuilder: (context, index) {
              final departmentData = state.response[index];
              final departmentName = _departmentMapping[departmentData.department] ?? departmentData.department;
              final positionsData = departmentData.positions;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      departmentName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  ...positionsData.map((el) => LeadershipItemWidget(positionsResponse: el)),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                    thickness: 1,
                  ),
                ],
              );
            },
          );
        }
        return const Center(child: Text("Không có dữ liệu"));
      },
    );
  }
}

class LeadershipItemWidget extends StatelessWidget {
  final PositionsResponse positionsResponse;
  const LeadershipItemWidget({
    required this.positionsResponse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...positionsResponse.employees.map((e) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LeadershipScreen(
                      personId: e.personId,
                      leaderName: e.name,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          "Chức vụ: ${positionsResponse.name}",
                          style: const TextStyle(fontSize: 11.5, color: Colors.black87),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
