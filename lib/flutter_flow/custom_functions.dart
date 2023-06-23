import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? allJobsList() {
  List<String> jobTypes = [
    'Dart Developer',
    'Flutter Developer',
    'Dart Backend Developer',
    'Dart Frontend Developer',
    'Dart Full Stack Developer',
    'Dart Software Engineer',
    'Dart Mobile App Developer',
    'Dart Web Developer',
    'Dart Game Developer',
    'Dart Automation Engineer',
    'Dart DevOps Engineer',
    'Dart UI/UX Designer',
    'Dart Data Engineer',
    'Dart Data Scientist',
    'Dart Machine Learning Engineer',
    'Dart Artificial Intelligence Developer',
    'Dart Blockchain Developer',
    'Dart Cryptocurrency Developer',
    'Dart Cloud Developer',
    'Dart API Developer',
    'Dart Integration Developer',
    'Dart Testing Engineer',
    'Dart Security Engineer',
    'Dart Performance Engineer',
    'Dart System Architect',
    'Dart Technical Writer',
    'Dart Trainer or Instructor',
    'Dart Consultant',
    'Dart Project Manager',
    'Dart Software Architect',
  ];
  return jobTypes;
}

List<String>? jobTypeList() {
  List<String> jobTypes = [
    '4 hour shift',
    '8 hour shift',
    '10 hour shift',
    '12 hour shift',
    'Monday to Friday',
    'Day shift',
    'Night shift',
    'Evening shift',
    'No nights',
    'Overnight shift',
    'Weekend availability',
    'Weekends only',
    'No Weekends',
    'On call',
    'Holidays',
    'Choose your own hours',
    'After school',
    'Overtime',
    'Other',
  ];
  return jobTypes;
}

List<String>? benefitsList() {
  List<String> benefitsTypes = [
    'Health insurance',
    'Paid time off',
    'Dental insurance',
    '401(k)',
    'Vision insurance',
    'Flexible schedule',
    'Tution reimbursement',
    'Life insurance',
    '410(k) matching',
    'Retirement plan',
    'Referral program',
    'Employee discount',
    'Flexible spending account',
    'Health savings account',
    'Relocation assistance',
    'Parental leave',
    'Professional development assistance',
    'Employee assistance program',
    'Other',
  ];
  return benefitsTypes;
}

bool? isAddEmailVisible() {
  List<int> clonedList = [...FFAppState().emailBoxes];

  if (clonedList.contains(0)) {
    return true;
  } else {
    return false;
  }
}
