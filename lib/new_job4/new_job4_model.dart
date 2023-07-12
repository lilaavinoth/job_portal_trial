import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewJob4Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for min widget.
  TextEditingController? minController;
  String? Function(BuildContext, String?)? minControllerValidator;
  String? _minControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for max widget.
  TextEditingController? maxController;
  String? Function(BuildContext, String?)? maxControllerValidator;
  String? _maxControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for MMDropDown widget.
  String? mMDropDownValue;
  FormFieldController<String>? mMDropDownValueController;
  // State field(s) for amount widget.
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  String? _amountControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for amountDropDown widget.
  String? amountDropDownValue;
  FormFieldController<String>? amountDropDownValueController;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FullJobRecord? lastJobDocument;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    minControllerValidator = _minControllerValidator;
    maxControllerValidator = _maxControllerValidator;
    amountControllerValidator = _amountControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    minController?.dispose();
    maxController?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
