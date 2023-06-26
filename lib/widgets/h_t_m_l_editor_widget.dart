// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html_editor_enhanced/utils/toolbar.dart';

import 'package:html_editor_enhanced/utils/options.dart';
import 'package:flutter/foundation.dart';

class HTMLEditorWidget extends StatefulWidget {
  const HTMLEditorWidget({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<HTMLEditorWidget> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        HtmlEditor(
          controller: controller, //required
          htmlEditorOptions: HtmlEditorOptions(
            autoAdjustHeight: true,
            spellCheck: true,
            darkMode: false,
            hint: "Type your job description",
            initialText: widget.currentHtml,
          ),
          htmlToolbarOptions: const HtmlToolbarOptions(
            // separatorWidget: const VerticalDivider(indent: 2, endIndent: 2, color: Colors.black),
            // initiallyExpanded: true,
            // renderSeparatorWidget: true,
            renderBorder: true,
            buttonSelectedColor: Colors.white,
            buttonFillColor: Colors.green,
            buttonColor: Colors.black,
            toolbarType: ToolbarType.nativeGrid,
            defaultToolbarButtons: [
              FontButtons(),
              ListButtons(listStyles: false),
              ParagraphButtons(
                  textDirection: false,
                  lineHeight: false,
                  caseConverter: false),
            ],
          ),
          otherOptions: const OtherOptions(
            height: 540,
            // decoration: BoxDecoration(
            //   color: Colors.amber,
            //     borderRadius: BorderRadius.all(Radius.circular(5)),
            //     border: Border.fromBorderSide(
            //         BorderSide(color: Colors.black, width: 1)))
          ),
          callbacks: Callbacks(onChangeContent: (String? changed) {
            // print('content changed to $changed');
            FFAppState().HTMLpageDescription = changed!;
          }),
        ),
      ],
    ));
  }
}
