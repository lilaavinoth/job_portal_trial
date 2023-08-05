import 'dart:convert';
import 'dart:js_interop';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:job_portal_trial/firebaseModels/email.dart';
import 'package:provider/provider.dart';

import 'package:job_portal_trial/global.dart';

import '../../firebaseModels/readFullJob.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_model.dart';

export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final MySingleton mySingleton = MySingleton();

  late HomePageModel _model;

  fullJobModel jobObject = fullJobModel();
  String selectedContainerId = '';
  fullJobModel rightDisplayObj = fullJobModel();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    _model.whatTextfieldController ??=
        TextEditingController(text: 'Software Developer');
    _model.whereTextfieldController ??= TextEditingController(text: 'London');
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('HOME_FloatingActionButton_jikjlbs6_ON_TA');
            logFirebaseEvent('FloatingActionButton_auth');

            // startListening();

            // reportUsage("si_OKp5Khz6SKb0Kq", 3);

            // registerPayment();

            // reportUsageToStripe("si_OKp5Khz6SKb0Kq", 1);

            // openPaymentPage();

            // tryCloudFunction();

            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth('LoginPage', context.mounted);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.logout,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Color(0xFFAFC8E9),
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFAFC8E9),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'JobX',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Are you recruiting?',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_PAGE_ADVERTISE_NOW_BTN_ON_TAP');
                                      // logFirebaseEvent(
                                      //     'Button_firestore_query');
                                      // _model.count =
                                      //     await queryCompanyDetailsRecordCount(
                                      //   parent: currentUserReference,
                                      // );

                                      // bool present =
                                      //     await (isCompanyDetailsPresent());
                                      // print(present);

                                      if (await isCompanyDetailsPresent()) {
                                        logFirebaseEvent('Button_navigate_to');

                                        if (await isPendingJob()) {
                                          context.goNamed('pendingJob');
                                        } else {
                                          context.goNamed('newJob2');
                                        }
                                      } else {
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamed('newJob1');
                                      }

                                      setState(() {});
                                    },
                                    text: 'Advertise now',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF1867D2),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
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
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: 80.0,
            elevation: 4.0,
          ),
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.whatTextfieldController,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'What',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF1867D2),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      validator: _model
                                          .whatTextfieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.whereTextfieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Where',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF1867D2),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.black,
                                          ),
                                      validator: _model
                                          .whereTextfieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_SEARCH_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('JobListPage');
                                  },
                                  text: 'Search',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF1867D2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('liveJobs')
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFF2174D2),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          List<QueryDocumentSnapshot> jobDocs =
                                              snapshot.data!.docs;

                                          List<fullJobModel> jobs =
                                              jobDocs.map((doc) {
                                            return fullJobModel.fromMap(
                                                doc.data()
                                                    as Map<String, dynamic>);
                                          }).toList();

                                          return ListView.builder(
                                            itemCount: jobs.length,
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              final document = jobDocs[index];
                                              final containerId = document.id;
                                              final isSelected = containerId ==
                                                  selectedContainerId;

                                              fullJobModel jobObject =
                                                  jobs[index];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedContainerId =
                                                          containerId;

                                                      rightDisplayObj =
                                                          jobObject;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        border: isSelected
                                                            ? Border.all(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2.0)
                                                            : null),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          jobObject.jobTitle ??
                                                              "jobTitle",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                        Text(
                                                          "jobObject.companyName",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                        Text(
                                                          jobObject.townCity ??
                                                              "townCity",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 2.0,
                                color: Color(0xFF1867D2),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 20.0, 0.0),
                                  child: Container(
                                    // height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Column(
                                        // mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            rightDisplayObj.jobTitle ?? "",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.black,
                                                ),
                                          ),
                                          Text(
                                            rightDisplayObj.subItemId ?? "",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.black,
                                                ),
                                          ),
                                          Flexible(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                
                                                triggerEmail(rightDisplayObj);

                                                reportUsage(
                                                    rightDisplayObj.subItemId ??
                                                        "",
                                                    1);
                                              },
                                              text: 'Apply',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF1867D2),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> isCompanyDetailsPresent() async {
    if (loggedIn) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .collection('companyDetails')
          .get();

      return snapshot.size == 1 ? true : false;
    } else {
      return false;
    }
  }

  Future isPendingJob() async {
    if (loggedIn) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .collection('incompleteJob')
          .get();

      return snapshot.size == 1 ? true : false;
    } else {
      return false;
    }
  }

  Future<void> tryCloudFunction() async {
    if (loggedIn) {
      const url =
          'https://us-central1-jobx-global.cloudfunctions.net/helloWorld'; // Replace with the URL of your deployed Cloud Function

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // final jsonResponse = json.decode(response.body);
        print('Response from Cloud Function: ${response.body}');
      } else {
        print('Error calling Cloud Function: ${response.statusCode}');
      }
    }
  }

  Future<void> openPaymentPage() async {
    if (loggedIn) {
      final price = await FirebaseFirestore.instance
          .collection('products')
          .doc('prod_OKoHyTgO7bqRmK')
          .collection('prices')
          .where('active', isEqualTo: true)
          .limit(1)
          .get();

      final docRef = await FirebaseFirestore.instance
          .collection('customers')
          .doc(currentUserUid)
          .collection('checkout_sessions')
          .add({
        "expires_at": currentTimestampInSeconds() + 1800,
        "client": "web",
        "model": "subscription",
        "line_items": [
          {
            "price": price.docs[0].id, // metered billing price
          },
        ],
        "success_url": 'https://jobx.global/'
      });
      setState(() {
        print("this is the final line " + docRef.id);
        mySingleton.checkoutSessionID = docRef.id;
      });

      context.goNamed('postJob');
    }
  }

  Future<void> registerPayment() async {
    try {
      // Replace 'YOUR_CLOUD_FUNCTION_URL' with the URL of your deployed Cloud Function
      final url =
          'https://us-central1-jobx-global.cloudfunctions.net/registerPayment';

      // Replace these values with actual payment details
      final Map<String, dynamic> paymentData = {
        'amount': 2000,
        'currency': 'gbp',
        'description': 'This is a main test',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(paymentData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Handle the response from the Cloud Function
        print(data['clientSecret']);
      } else {
        // Handle the error response
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error: $e');
    }
  }

  Future<void> reportUsage(String subscriptionItemId, int quantity) async {
    try {
      final url =
          'https://us-central1-jobx-global.cloudfunctions.net/reportUsage';

      final Map<String, dynamic> usageData = {
        'subscriptionItemId': subscriptionItemId.toString(),
        'quantity': {
          "quantity": quantity,
          "timestamp": DateTime.now().millisecondsSinceEpoch ~/ 1000
        }
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(usageData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Handle the response from the Cloud Function
        print(data['clientSecret']);
      } else {
        // Handle the error response
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> startListening() async {
    const collectionPath =
        'customers/JiVwoZ2SpOcAZL6bov64z1Fycsh2/subscriptions/';

    const url =
        'https://us-central1-jobx-global.cloudfunctions.net/docListener'; // Replace with the URL of your deployed Cloud Function

    final Map<String, dynamic> path = {
      'collectionPath': collectionPath,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(path),
    );

    if (response.statusCode == 200) {
      print('Response from Cloud Function: ${response.body}');
    } else {
      print('Error calling Cloud Function: ${response.statusCode}');
    }
  }

  int currentTimestampInSeconds() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  Future triggerEmail(fullJobModel rightDisplayObj) async {
    if (loggedIn) {
      final emailPath = FirebaseFirestore.instance.collection('mail').doc();

      final messageContent = MessageContent(
          subject: '$currentUserDisplayName has applied for your ${rightDisplayObj.jobTitle}',
          text: 'You got a new candidate to review',
          html: 'This is the <code>HTML</code> section of the email');

      List<String> emailList = [rightDisplayObj.email1 ?? "", rightDisplayObj.email2 ?? "", rightDisplayObj.email3 ?? ""];

      final newEmail = emailModel(to: emailList, message: messageContent.toMap());

      await emailPath.set(newEmail.toMap());
    }
  }
}
