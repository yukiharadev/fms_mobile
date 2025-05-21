import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/src/repositories/auth_repository.dart';

import '../../../models/auth/response/user_info_response.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final AuthRepository repository;
  UserInfoBloc({required this.repository}) : super(UserInfoInitial()) {
    on<UserInfoRequested>(_onUserInfoRequested);
  }

  Future<void> _onUserInfoRequested(
    UserInfoRequested event,
    Emitter<UserInfoState> emit,
  ) async {
    emit(const UserInfoLoading());
    try {
      final userInfoResponse = await repository.getUserInfo();
      emit(UserInfoSuccess(userInfoResponse: userInfoResponse));
    } catch (e) {
      emit(UserInfoError(message: e.toString()));
    }
  }
}
