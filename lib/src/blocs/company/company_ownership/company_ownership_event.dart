part of 'company_ownership_bloc.dart';

abstract class CompanyOwnershipEvent extends Equatable {
  const CompanyOwnershipEvent();
}

class GetCompanyOwnership extends CompanyOwnershipEvent {
  final String symbol;

  const GetCompanyOwnership({required this.symbol});

  @override
  List<Object> get props => [symbol];
}
