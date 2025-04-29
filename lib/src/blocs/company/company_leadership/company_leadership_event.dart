part of 'company_leadership_bloc.dart';

sealed class CompanyLeadershipEvent extends Equatable {
  const CompanyLeadershipEvent();
}

class GetCompanyLeadership extends CompanyLeadershipEvent {
  final String companyId;

  const GetCompanyLeadership({required this.companyId});

  @override
  List<Object> get props => [companyId];
}
