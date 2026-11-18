// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/backend/api_requests/api_calls.dart';
// Begin custom action code

/// Envoie une notification push OneSignal à un utilisateur (client ou
/// électricien) à partir de son id dans la table `users`.
/// Ne fait rien si l'utilisateur n'a pas d'identifiant OneSignal.
Future<void> notifyUser(
  String? userId,
  String title,
  String message,
) async {
  if (userId == null || userId.isEmpty) {
    return;
  }
  try {
    final rows = await UsersTable().queryRows(
      queryFn: (q) => q.eq('id', userId),
      limit: 1,
    );
    final playerId = rows.isNotEmpty ? rows.first.onesignalPlayerId : null;
    if (playerId == null || playerId.isEmpty) {
      return;
    }
    await NewsendpushOneSignalCall.call(
      playerIds: [playerId],
      heading: title,
      content: message,
    );
  } catch (_) {
    // Une notification qui échoue ne doit jamais bloquer l'action principale.
  }
}
