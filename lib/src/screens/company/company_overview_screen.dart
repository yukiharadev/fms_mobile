import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/company/company_ownership/company_ownership_bloc.dart';
import 'package:my_app/src/widgets/company/ownership_structure.dart';
import 'package:readmore/readmore.dart';
import '../../models/company/response/company_overview_response.dart';

class CompanyOverviewScreen extends StatefulWidget {
  final String symbol;
  final CompanyOverviewResponse companyOverview;
  const CompanyOverviewScreen({super.key, required this.symbol, required this.companyOverview});

  @override
  State<CompanyOverviewScreen> createState() => _CompanyOverviewScreenState();
}

class _CompanyOverviewScreenState extends State<CompanyOverviewScreen> {
  @override
  void initState() {
    context.read<CompanyOwnershipBloc>().add(GetCompanyOwnership(symbol: widget.symbol));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: widget.companyOverview.company?.logoUrl ?? '',
            fit: BoxFit.cover,
            height: 150,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // Company Name and Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  widget.companyOverview.company?.companyName ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText(
                  widget.companyOverview.company?.description ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  trimCollapsedText: ' Xem thêm',
                  trimExpandedText: '\nThu gọn',
                  lessStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  moreStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1),
              ],
            ),
          ),
          // Basic Information
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Thông tin cơ bản",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Loại hình: ${widget.companyOverview.sector?.name ?? 'N/A'}",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black),
                ),
                Text(
                  "Website: ${widget.companyOverview.company?.website ?? 'N/A'}",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black),
                ),
                Text(
                  "Địa chỉ: ${widget.companyOverview.company?.address ?? 'N/A'}",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black),
                ),
                Text(
                  "Điện thoại: ${widget.companyOverview.company?.phoneNumber ?? 'N/A'}",
                  style: const TextStyle(fontSize: 12.5, color: Colors.black),
                ),
                const Divider(color: Colors.black, thickness: 1),
              ],
            ),
          ),
          // Financial Metrics
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chỉ số tài chính",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _buildFinancialRow("P/E", "6.93"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("P/B", "1.39"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("Vốn hóa", "116,356.44"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("ESP Cơ bản", "3.76"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("ESP pha loãng", "3.76"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("Tỷ lệ % room NN", "0.00"),
                const Divider(color: Colors.black54, thickness: 0.3),
                _buildFinancialRow("Giá trị sổ sách", "18.69"),
                const Divider(color: Colors.black54, thickness: 0.3),
              ],
            ),
          ),
          // Ownership Structure
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cơ cấu sở hữu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CompanyOwnershipBloc, CompanyOwnershipState>(
                  builder: (context, ownershipState) {
                    if (ownershipState is CompanyOwnershipLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (ownershipState is CompanyOwnershipError) {
                      return Center(child: Text("Error: ${ownershipState.message}"));
                    } else if (ownershipState is CompanyOwnershipSuccess) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: OwnershipStructure(
                          data: ownershipState.response,
                        ),
                      );
                    }
                    return const Center(child: Text("Unknown state"));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12.5, color: Colors.black),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.5,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
