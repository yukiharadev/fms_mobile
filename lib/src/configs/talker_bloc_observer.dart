import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerBlocObserver extends BlocObserver {
  final Talker talker;

  TalkerBlocObserver({required this.talker});

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    talker.info('[BLOC EVENT] ${bloc.runtimeType} → $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    talker.debug('[BLOC TRANSITION] ${bloc.runtimeType} → $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    talker.debug('[BLOC CHANGE] ${bloc.runtimeType} → $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    talker.error('[BLOC ERROR] ${bloc.runtimeType}', error, stackTrace);
  }
}
