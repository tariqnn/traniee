import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double calcProgress(
  int numOfWorkouts,
  int isDoneState,
) {
  if (numOfWorkouts == 0) return 0;

  double progress = (isDoneState / numOfWorkouts);

  if (progress > 1) return 1;

  return progress;
}

String calcProgressText(
  int numOfWorkouts,
  int isDoneState,
) {
  if (numOfWorkouts == 0) return "0%";

  int progress = ((isDoneState / numOfWorkouts) * 100).round();

  if (progress > 100) return "100%";

  return ((isDoneState / numOfWorkouts) * 100).round().toString() + "%";
}

DateTime calcEndDate(
  DateTime startDate,
  double months,
) {
  return startDate.add(Duration(days: (months * 30).round()));
}

String? gymStausCal(int? currUsers) {
  if (currUsers == null || currUsers == 0) return "Empty";
  if (currUsers <= 20) {
    return "Not Busy";
  } else if (currUsers >= 20 && currUsers <= 45) {
    return "Busy";
  } else
    return "Full";
}
