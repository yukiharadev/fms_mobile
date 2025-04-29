part of 'top_company_bloc.dart';

abstract class TopCompanyState extends Equatable {
  const TopCompanyState();

  @override
  List<Object> get props => [];
}

final class TopCompanyInitial extends TopCompanyState {
  const TopCompanyInitial();
}

class TopCompanyLoading extends TopCompanyState {
  final String centerId;
  const TopCompanyLoading(this.centerId);
}

class TopCompanySuccess extends TopCompanyState {
  final String centerId;
  final List<TopCompanyFloorResponse> topCompanyFloorResponse;
  const TopCompanySuccess(this.centerId, this.topCompanyFloorResponse);

  @override
  List<Object> get props => [centerId, topCompanyFloorResponse];
}

class TopCompanyError extends TopCompanyState {
  final String centerId;
  final String message;
  const TopCompanyError({required this.centerId, required this.message});

  @override
  List<Object> get props => [message];
}
