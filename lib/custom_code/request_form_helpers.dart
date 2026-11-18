import 'package:flutter/material.dart';

/// Vérifie le formulaire de demande. Renvoie un message d'erreur
/// (français / anglais) ou `null` si tout est bon.
String? validateRequestForm({
  required String name,
  required String phone,
  required String address,
  required String description,
  required bool isAppointment,
  DateTime? appointmentDate,
}) {
  final missing = <String>[];
  if (name.trim().isEmpty) missing.add('nom');
  if (phone.replaceAll(RegExp(r'[^0-9+]'), '').length < 8) {
    missing.add('téléphone');
  }
  if (address.trim().isEmpty) missing.add('adresse');
  if (description.trim().isEmpty) missing.add('description du problème');
  if (missing.isNotEmpty) {
    return 'Merci de remplir : ${missing.join(', ')}. / Please fill in all required fields.';
  }
  if (isAppointment && appointmentDate == null) {
    return 'Choisissez une date et une heure de rendez-vous. / Please pick an appointment date and time.';
  }
  return null;
}

/// Affiche un message en bas de l'écran (vert = succès, rouge = erreur).
void showRequestMessage(BuildContext context, String text,
    {bool isError = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 15)),
        backgroundColor:
            isError ? const Color(0xFFD32F2F) : const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
}
