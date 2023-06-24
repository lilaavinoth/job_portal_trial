import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for whatTextfield widget.
  TextEditingController? whatTextfieldController;
  String? Function(BuildContext, String?)? whatTextfieldControllerValidator;
  String? _whatTextfieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for whereTextfield widget.
  TextEditingController? whereTextfieldController;
  String? Function(BuildContext, String?)? whereTextfieldControllerValidator;
  String? _whereTextfieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? count;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    whatTextfieldControllerValidator = _whatTextfieldControllerValidator;
    whereTextfieldControllerValidator = _whereTextfieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    whatTextfieldController?.dispose();
    whereTextfieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
