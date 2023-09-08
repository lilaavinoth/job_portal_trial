import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_portal_trial/firebaseModels/readFullJob.dart';
import 'package:job_portal_trial/job_admin/job_admin_function.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class TextUtils {
  static Text buildText(String text, {Color? color, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        // You can add more styling options here
      ),
    );
  }

  static Row buildSalary(fullJobModel jobModel) {
    if (jobModel.min != null) {
      return TextUtils.buildRangeSalary(
          jobModel.min, jobModel.max, jobModel.minMaxRate);
    }
    if (jobModel.amountRate != null) {
      return TextUtils.buildAmountSalary(jobModel.amount, jobModel.amountRate);
    }
    return const Row(
      children: [
        Text("No salary information available")
      ], // You can customize this as needed
    );
  }

  static Row buildRangeSalary(int? min, int? max, String? minMaxRate) {
    return Row(children: [
      TextUtils.buildText(min.toString()),
      TextUtils.buildText(" - "),
      TextUtils.buildText(max.toString()),
      TextUtils.buildText(" $minMaxRate"),
    ]);
  }

  static Row buildAmountSalary(int? amount, String? amountRate) {
    return Row(children: [
      TextUtils.buildText(amount.toString()),
      TextUtils.buildText(" $amountRate"),
    ]);
  }

  static Text buildList(List<dynamic> list) {
    String concatenatedText = list.join('\n');
    return Text(
      concatenatedText,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  static Padding buildHTML(String text) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Html(style: {
        "body": Style(color: Colors.black), // Change color as needed
      }, data: text),
    );
  }
}



class LayoutUtils {
  static Padding buildSerialNo(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextUtils.buildText(text),
        ],
      ),
    );
  }

  static Padding buildJobTitle(fullJobModel jobObject) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils.buildText(jobObject.jobTitle ?? "Job Title"),
          TextUtils.buildText(jobObject.streetAddress ?? "Job location"),
        ],
      ),
    );
  }

  static Padding buildJobApplicants(String appliedCount) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils.buildText("Applications Received"),
          TextUtils.buildText(appliedCount),
        ],
      ),
    );
  }

  static Padding buildJobStatus(String status, Color displayColor) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: displayColor, borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils.buildText("Job Status"),
            TextUtils.buildText(status),
          ],
        ),
      ),
    );
  }

  static Padding buildJobPosted(String timeStamp) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils.buildText("Posted on"),
            TextUtils.buildText(timeStamp),
          ],
        ),
      ),
    );
  }

  static Padding buildJobViews(String total) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtils.buildText("Viewed"),
            TextUtils.buildText(total),
          ],
        ),
      ),
    );
  }
}

class ButtonUtils {
  static Padding buildAdvertiseJobBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: FFButtonWidget(
        onPressed: () async {
          if (await JobAdminFunctions.isCompanyDetailsPresent()) {
            if (await JobAdminFunctions.isPendingJob()) {
              context.goNamed('pendingJob');
            } else {
              context.goNamed('newJob2');
            }
          } else {
            context.goNamed('newJob1');
          }
        },
        text: 'Post a job',
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: Color(0xFF1867D2),
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
