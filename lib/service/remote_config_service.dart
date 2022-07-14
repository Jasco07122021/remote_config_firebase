import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initConfig() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await remoteConfig.setDefaults(const {
      "background_color": "white",
    });

    fetchConfig();
  }

  static Future<String> fetchConfig() async {
    await remoteConfig.fetchAndActivate();
    String backgroundColor =
        remoteConfig.getString("background_color").isNotEmpty
            ? remoteConfig.getString("background_color")
            : "white";
    return backgroundColor;
  }
}
