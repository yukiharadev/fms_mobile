import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/src/DependencyInjection/service_locator.dart';
import 'package:my_app/src/blocs/home/top_company/top_company_bloc.dart';
import 'package:my_app/src/configs/constants.dart';
import 'package:my_app/src/widgets/home/table_company_widget.dart';
import '../../repositories/top_company_repository.dart';
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
              _buildSection(context, "10", "Top công ty sàn HOSE"),
              _buildSection(context, "02", "Top công ty sàn HNX"),
              _buildSection(context, "03", "Top công ty sàn UPCOM"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String centerId, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 14,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => TopCompanyBloc(
            topCompanyRepository: getIt<TopCompanyRepository>(),
          )..add(TopCompanyRequested(centerId: centerId)),
          child: BlocBuilder<TopCompanyBloc, TopCompanyState>(
            builder: (context, state) {
              if (state is TopCompanyLoading && state.centerId == centerId) {
                return Center(
                    child: Text(
                  "Loading...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ));
              } else if (state is TopCompanySuccess && state.centerId == centerId) {
                return TableCompanyWidget(companies: state.topCompanyFloorResponse);
              } else if (state is TopCompanyError && state.centerId == centerId) {
                return Center(child: Text(state.message));
              }
              context.read<TopCompanyBloc>().add(TopCompanyRequested(centerId: centerId));
              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
