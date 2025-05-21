part of 'all_company_bloc.dart';

sealed class AllCompanyEvent extends Equatable {
  const AllCompanyEvent();
}

final class AllCompanyLoadEvent extends AllCompanyEvent {
  final GetPageRequest request;
  const AllCompanyLoadEvent(this.request);

  @override
  List<Object> get props => [request];
}
