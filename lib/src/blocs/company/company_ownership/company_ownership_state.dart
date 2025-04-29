part of 'company_ownership_bloc.dart';

sealed class CompanyOwnershipState extends Equatable {
  const CompanyOwnershipState();
  @override
  List<Object> get props => [];
}

final class CompanyOwnershipInitial extends CompanyOwnershipState {
  const CompanyOwnershipInitial();
}

class CompanyOwnershipLoading extends CompanyOwnershipState {
  const CompanyOwnershipLoading();
}

class CompanyOwnershipSuccess extends CompanyOwnershipState {
  final List<OwnershipResponse> response;
  const CompanyOwnershipSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CompanyOwnershipError extends CompanyOwnershipState {
  final String message;
  const CompanyOwnershipError({required this.message});

  @override
  List<Object> get props => [message];
}
