import 'package:talker_flutter/talker_flutter.dart';

class TalkerConfig {
  static final Talker talker = Talker(
    settings: TalkerSettings(
      enabled: true,
      useConsoleLogs: true,
    ),
    logger: TalkerLogger(
      output: (String message) => print(message),
      settings: TalkerLoggerSettings(
        level: LogLevel.debug,
      ),
    ),
  );
}
