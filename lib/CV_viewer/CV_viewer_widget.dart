import 'package:flutter/material.dart';
import 'package:job_portal_trial/job_admin/job_admin_provider.dart';
import 'package:provider/provider.dart';

class CV_viewer_widget extends StatefulWidget {
  const CV_viewer_widget({super.key});

  @override
  State<CV_viewer_widget> createState() => _CV_viewer_widgetState();
}

class _CV_viewer_widgetState extends State<CV_viewer_widget> {
  // String docPath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // docPath = Provider.of<JobAdminProvider>(context, listen: false).docPath;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobAdminProvider>(
        builder: (context, jobAdminProvider, child) {
      return Container(
        child: Text(jobAdminProvider.docPath),
      );
    });
  }
}
