import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';
  final String _authEnableStatusStorageKey = 'AUTH_STATUS';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String _authToken = "";
  static String _uid = "";
  static String _authEnableStatus = "default";

  getToken() => _authToken;
  getUid() => _uid;
  isAuthEnabled() => _authEnableStatus;

  Future<String> getAuthToken() async {
    final SharedPreferences prefs = await _prefs;
    _authToken = prefs.getString(_authTokenStorageKey) ?? '';

    return _authToken;
  }

  Future<String> getAuthUID() async {
    final SharedPreferences prefs = await _prefs;
    _uid = prefs.getString(_userIDStorageKey) ?? '';

    return _uid;
  }

  Future<String> getAuthEnableStatus() async {
    final SharedPreferences prefs = await _prefs;
    _authEnableStatus =
        prefs.getString(_authEnableStatusStorageKey) ?? "default";

    return _authEnableStatus;
  }

  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    print('called: $token');
    _authToken = token;
    prefs.setString(_authTokenStorageKey, token);
  }

  Future<void> setUID(String uID) async {
    final SharedPreferences prefs = await _prefs;
    _uid = uID;
    prefs.setString(_userIDStorageKey, uID);
  }

  Future<void> setAuthEnableStatus(String status) async {
    final SharedPreferences prefs = await _prefs;
    _authEnableStatus = status;
    prefs.setString(_authEnableStatusStorageKey, _authEnableStatus);
  }

  Future<void> deleteTokens() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(_authTokenStorageKey);
    prefs.remove(_userIDStorageKey);
    prefs.remove(_authEnableStatusStorageKey);
    _authToken = "";
    _authEnableStatus = "default";
  }
}
