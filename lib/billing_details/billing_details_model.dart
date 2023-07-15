import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillingDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for address1 widget.
  TextEditingController? address1Controller;
  String? Function(BuildContext, String?)? address1ControllerValidator;
  String? _address1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for address2 widget.
  TextEditingController? address2Controller;
  String? Function(BuildContext, String?)? address2ControllerValidator;
  // State field(s) for townCity widget.
  TextEditingController? townCityController;
  String? Function(BuildContext, String?)? townCityControllerValidator;
  String? _townCityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for postCode widget.
  TextEditingController? postCodeController;
  String? Function(BuildContext, String?)? postCodeControllerValidator;
  String? _postCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    address1ControllerValidator = _address1ControllerValidator;
    townCityControllerValidator = _townCityControllerValidator;
    postCodeControllerValidator = _postCodeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    address1Controller?.dispose();
    address2Controller?.dispose();
    townCityController?.dispose();
    postCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
