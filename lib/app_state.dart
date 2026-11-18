import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _firstTime = prefs.getBool('ff_firstTime') ?? _firstTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
  }

  /// Type de compte (individual / business), chargé depuis la table users.
  String _userAccountType = '';
  String get userAccountType => _userAccountType;
  set userAccountType(String value) {
    _userAccountType = value;
  }

  /// Recharge le rôle et le type de compte de l'utilisateur connecté
  /// depuis la table `users` (appelé à chaque connexion / rafraîchissement).
  Future<void> loadUserRole(String? uid) async {
    if (uid == null || uid.isEmpty) {
      _userRole = '';
      _userAccountType = '';
      _isAdmin = false;
      notifyListeners();
      return;
    }
    try {
      final rows = await UsersTable().queryRows(
        queryFn: (q) => q.eq('id', uid),
        limit: 1,
      );
      final user = rows.isNotEmpty ? rows.first : null;
      _userRole = user?.role ?? '';
      _userAccountType = user?.accountType ?? '';
      _isAdmin = _userRole == 'admin';
    } catch (_) {
      _userRole = '';
      _userAccountType = '';
      _isAdmin = false;
    }
    notifyListeners();
  }

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;
  set isAdmin(bool value) {
    _isAdmin = value;
  }

  /// assistant
  String _assistantRole = '';
  String get assistantRole => _assistantRole;
  set assistantRole(String value) {
    _assistantRole = value;
  }

  bool _isTracking = false;
  bool get isTracking => _isTracking;
  set isTracking(bool value) {
    _isTracking = value;
  }

  bool _firstTime = false;
  bool get firstTime => _firstTime;
  set firstTime(bool value) {
    _firstTime = value;
    prefs.setBool('ff_firstTime', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
