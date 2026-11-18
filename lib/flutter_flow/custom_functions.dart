import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double calculateTotalPrice(
  String? quantity,
  String? unitPrice,
) {
  final q = double.tryParse(quantity ?? '') ?? 0;
  final p = double.tryParse(unitPrice ?? '') ?? 0;

  return q * p;
}

double calculateLabourCost(
  String? minutes,
  String? hourlyRate,
) {
  final mins = double.tryParse(minutes ?? '') ?? 0;
  final rate = double.tryParse(hourlyRate ?? '') ?? 0;

  return (mins / 60) * rate;
}

double calculateInvoiceTotal(
  String? labourMinutes,
  double? materialsCost,
  double? hourlyRate,
) {
  final mins = double.tryParse(labourMinutes ?? '') ?? 0;
  final materials = materialsCost ?? 0;
  final rate = hourlyRate ?? 50.0;

  const travelCost = 50.0;
  const diagnosticFee = 100.0;
  const fixedCommission = 30.0;

  final extraMinutes = mins > 30 ? mins - 30 : 0;
  final labourCost = (extraMinutes / 60) * rate;
  final serviceSubtotal = travelCost + diagnosticFee + materials + labourCost;

  final variableCommission = serviceSubtotal * 0.12;
  return serviceSubtotal + fixedCommission + variableCommission;
}

DateTime? getAppointmentStart(DateTime appointmentDate) {
  final hour = appointmentDate.hour;

  if (hour < 10) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      8,
      0,
    );
  }

  if (hour < 13) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      10,
      0,
    );
  }

  if (hour < 15) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      13,
      0,
    );
  }

  return DateTime(
    appointmentDate.year,
    appointmentDate.month,
    appointmentDate.day,
    15,
    0,
  );
}

DateTime? getAppointmentEnd(DateTime appointmentDate) {
  final hour = appointmentDate.hour;

  if (hour < 10) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      10,
      0,
    );
  }

  if (hour < 13) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      12,
      0,
    );
  }

  if (hour < 15) {
    return DateTime(
      appointmentDate.year,
      appointmentDate.month,
      appointmentDate.day,
      15,
      0,
    );
  }

  return DateTime(
    appointmentDate.year,
    appointmentDate.month,
    appointmentDate.day,
    17,
    0,
  );
}

String generateUUID() {
  final random = DateTime.now().microsecondsSinceEpoch.toRadixString(16);

  return '${random.substring(0, 8)}-${random.substring(0, 4)}-4${random.substring(0, 3)}-8${random.substring(0, 3)}-${random.padLeft(12, '0').substring(0, 12)}';
}

dynamic stringListToJson(List<String> items) {
  return items;
}

String? combineAddress(
  String addressLine,
  String city,
  String postcode,
) {
  return '$addressLine, $city, $postcode';
}
