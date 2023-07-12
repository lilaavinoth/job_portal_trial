import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BillingDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for address1 widget.
  TextEditingController? address1Controller;
  String? Function(BuildContext, String?)? address1ControllerValidator;
  // State field(s) for address2 widget.
  TextEditingController? address2Controller;
  String? Function(BuildContext, String?)? address2ControllerValidator;
  // State field(s) for townCity widget.
  TextEditingController? townCityController;
  String? Function(BuildContext, String?)? townCityControllerValidator;
  // State field(s) for postCode widget.
  TextEditingController? postCodeController;
  String? Function(BuildContext, String?)? postCodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
