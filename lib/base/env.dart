abstract class EnvVars {
  String get baseUrl;

  String get graphqlEndPoint;

  String get androidClientId;

  String get iosClientId;

  String get serverClientId;
}

class Env implements EnvVars {
  Env._();

  static Env? _instance;

  late EnvVars _env;

  /// Returns an instance using the default [Env].
  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  void initEnv(EnvVars incomingEnv) => _env = incomingEnv;

  @override
  String get baseUrl => _env.baseUrl;

  @override
  String get graphqlEndPoint => _env.graphqlEndPoint;

  @override
  String get androidClientId => _env.androidClientId;

  @override
  String get iosClientId => _env.iosClientId;

  @override
  String get serverClientId => _env.serverClientId;
}
