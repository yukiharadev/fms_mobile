part of 'top_company_bloc.dart';

abstract class TopCompanyEvent extends Equatable {
  const TopCompanyEvent();
}

class TopCompanyRequested extends TopCompanyEvent {
  final String centerId;

  const TopCompanyRequested({required this.centerId});

  @override
  List<Object> get props => [centerId];
}
