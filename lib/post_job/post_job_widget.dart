import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:job_portal_trial/firebaseModels/subscriptionModel.dart';
import 'package:job_portal_trial/global.dart';

import '../auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_job_model.dart';
export 'post_job_model.dart';
import 'dart:html' as html;

class PostJobWidget extends StatefulWidget {
  const PostJobWidget({Key? key}) : super(key: key);

  @override
  _PostJobWidgetState createState() => _PostJobWidgetState();
}

class _PostJobWidgetState extends State<PostJobWidget> {
  late PostJobModel _model;

  subscriptionModel subscriptionObject = subscriptionModel();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostJobModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'postJob'});
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
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('customers')
                .doc(currentUserUid)
                .collection('checkout_sessions')
                .doc(MySingleton().checkoutSessionID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              // final data = snapshot.requireData.data()!;
              subscriptionObject = subscriptionModel
                  .fromMap(snapshot.data!.data() as Map<String, dynamic>);

              print("data obtained " + subscriptionObject.toString());

              print("raw data " + snapshot.data!.data().toString());


              if (subscriptionObject.sessionId != null &&
                  subscriptionObject.url != null) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Html(
                        data: html.window.location.href = subscriptionObject.url.toString(),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
