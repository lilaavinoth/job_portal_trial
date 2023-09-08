import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_portal_trial/auth/firebase_auth/auth_util.dart';
import 'package:job_portal_trial/firebaseModels/resumeModel.dart';
import 'package:job_portal_trial/job_admin/job_admin_provider.dart';
import 'package:job_portal_trial/widgets/utils.dart';
import 'package:provider/provider.dart';
import '../backend/backend.dart';
import '../firebaseModels/readFullJob.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'job_admin_model.dart';

export 'job_admin_model.dart';

class JobAdminWidget extends StatefulWidget {
  const JobAdminWidget({Key? key}) : super(key: key);

  @override
  _JobAdminWidgetState createState() => _JobAdminWidgetState();
}

class _JobAdminWidgetState extends State<JobAdminWidget> {
  late JobAdminModel _model;

  Uint8List? _fileBytes;
  String? _fileName;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobAdminModel());

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
              'Admin panel',
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
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils.buildText('Posted Jobs'),
                          ButtonUtils.buildAdvertiseJobBtn(context)
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('liveJobs')
                              .where('postedBy', isEqualTo: currentUserUid)
                              .where('subItemId', isNotEqualTo: '')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              print('waiting');
                              return const Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF2174D2),
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Text('No data available.'),
                              );
                            }
                            List<QueryDocumentSnapshot> jobDocs =
                                snapshot.data!.docs;

                            List<fullJobModel> jobs = jobDocs.map((doc) {
                              return fullJobModel
                                  .fromMap(doc.data() as Map<String, dynamic>);
                            }).toList();

                            final provider = Provider.of<JobAdminProvider>(
                                context,
                                listen: true);

                            return ListView.builder(
                                itemCount: jobs.length,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  final document = jobDocs[index];
                                  final containerId = document.id;

                                  fullJobModel jobObject = jobs[index];

                                  return Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          provider.passDocPath(containerId);
                                          context.goNamed('CVviewer');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              LayoutUtils.buildSerialNo(
                                                  (index + 1).toString()),
                                              LayoutUtils.buildJobTitle(
                                                  jobObject),
                                              LayoutUtils.buildJobViews(
                                                  countValues(jobObject)),
                                              LayoutUtils.buildJobApplicants(
                                                  appliedCount(jobObject)),
                                              LayoutUtils.buildJobStatus(
                                                  jobObject.status ??
                                                      "Job Status",
                                                  colorDecider(
                                                      jobObject.status ??
                                                          "Job Status")),
                                              LayoutUtils.buildJobPosted(
                                                  timeStamp(jobObject)),
                                              TextUtils.buildText(containerId)
                                            ],
                                          ),
                                        ),
                                      ));
                                });
                          }),
                    ),
                  ]),
            ),
          ),
        ));
  }

  String appliedCount(fullJobModel jobObject) {
    return (jobObject.appliedList?.isEmpty ?? true
            ? 0
            : jobObject.appliedList!.length)
        .toString();
  }

  String timeStamp(fullJobModel jobObject) {
    Timestamp timestamp = jobObject.timestamp as Timestamp;

    // Format the timestamp using DateFormat
    return (DateFormat('d MMM yyyy').format(timestamp.toDate())).toString();
  }

  colorDecider(String status) {
    if (status == "live") {
      return Color(Color.fromARGB(255, 49, 204, 93).value);
    }
    return Color(Color.fromARGB(255, 154, 167, 158).value);
  }

  String countValues(fullJobModel jobObject) {
    int totalViewCount = 0;

    // if(jobObject.viewCount != null)
    // Iterate through the values of the viewCount map and sum them up
    jobObject.viewCount?.values.forEach((count) {
      totalViewCount += count as int;
    });

    return totalViewCount.toString();
  }
}
