import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal_trial/auth/firebase_auth/auth_util.dart';
import 'package:job_portal_trial/firebaseModels/resumeModel.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'upload_resume_model.dart';

export 'upload_resume_model.dart';

class UploadResumeWidget extends StatefulWidget {
  const UploadResumeWidget({Key? key}) : super(key: key);

  @override
  _UploadResumeWidgetState createState() => _UploadResumeWidgetState();
}

class _UploadResumeWidgetState extends State<UploadResumeWidget> {
  late UploadResumeModel _model;

  Uint8List? _fileBytes;
  String? _fileName;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadResumeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'uploadResume'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE8EAF6),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A73E8),
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: 800.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 0.0, 20.0),
                                  child: Text(
                                    'Upload Resume',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                width: 800.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 10.0),
                                        child: Text(
                                          'Add your CV or Resume to apply for a job',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'UPLOAD_RESUME_PAGE_UPLOAD_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_upload_file_to_firebase');

                                                  pickPDF();
                                                },
                                                text: 'Upload',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF1A73E8),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadData(storagePath, bytes) {}

  Future pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _fileBytes = result.files.single.bytes;
        _fileName = result.files.single.name;
        print(_fileName);
        uploadToFirestore();
      });
    } else {
      // User canceled the file picking
      setState(() {
        _fileBytes = null;
        _fileName = null;
      });
    }
  }

  String generateRandomString(int length) {
    const String characterSet =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    StringBuffer randomString = StringBuffer();

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(characterSet.length);
      randomString.write(characterSet[randomIndex]);
    }

    return randomString.toString();
  }

  Future updateResumePath(String randomString) async {
    final resumePath = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .collection('userDetails')
          .doc('resumeData');

    final newdata = resumeModel(resumeList: [randomString]);

    await resumePath.set(newdata.toMap());
  }

  Future uploadToFirestore() async {
    if (_fileBytes == null || _fileName == null) {
      return;
    }

    try {
      String randomString = generateRandomString(5); // Generates a random string of length 10
      // Create a reference to the location in Firebase Storage where you want to upload the file
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('pdfs/$currentUserUid/$randomString');

      // Upload the file to Firebase Storage
      final TaskSnapshot uploadTask = await storageRef.putData(_fileBytes!);

      // Get the download URL of the uploaded file
      final String downloadURL = await uploadTask.ref.getDownloadURL();

      // Now you can save the downloadURL to Firestore or use it as needed
      print('Download URL: $downloadURL');
      updateResumePath(randomString);

      context.goNamed('homePage');

      // Reset the state after successful upload
      setState(() {
        _fileBytes = null;
        _fileName = null;
      });
    } catch (e) {
      // Handle any errors that occurred during the upload process
      print('Error uploading file: $e');
    }
  }
  
  
}
