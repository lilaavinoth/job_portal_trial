import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:job_portal_trial/firebaseModels/readFullJob.dart';

class LeftJobViewUtils {
  static Padding buildCompanyLogo() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(6), // Adjust the radius as needed
            color: _generateRandomColor(),
          ),
          alignment: Alignment.center,
          child: const Text(
            'text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ));
  }

  static Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static Padding buildLeftJobTitle(String text) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Text(text,
            style: const TextStyle(
                fontFamily: 'Roboto-Bold', color: Colors.black, fontSize: 20)));
  }

  static Padding buildLeftCompanyName(String text) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
        child: Text(text,
            style: const TextStyle(
              fontFamily: 'Roboto-Bold',
              color: Color.fromARGB(255, 38, 92, 230),
              fontSize: 15,
              decoration: TextDecoration.underline,
            )));
  }

  static Padding buildLeftTypeLocation(List<String>? jobType, String location) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 12, 0, 0),
        child: Row(
          children: [
            Text(jobType?.first.toString() ?? "",
                style: const TextStyle(
                  fontFamily: 'Roboto-Bold',
                  color: Colors.black,
                  fontSize: 15,
                )),
            const Gap(5),
            Container(
              width: 5, // Adjust the size as needed
              height: 5, // Adjust the size as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 126, 220,
                    26), // Change the color to your desired color
                border: Border.all(
                  color: const Color.fromARGB(255, 126, 220,
                      26), // Set the border color to match the dot color
                  width: 2, // Adjust the border width for a bold effect
                ),
              ),
            ),
            const Gap(5),
            Text(location,
                style: const TextStyle(
                  fontFamily: 'Roboto-Bold',
                  color: Colors.black,
                  fontSize: 15,
                )),
          ],
        ));
  }

  static Padding buildLeftPay(
      int? min, int? max, String? minMaxRate, int? amount, String? amountRate) {
    if (min != null) {
      return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFDDEE), // Container color
              borderRadius:
                  BorderRadius.circular(4), // Adjust the radius as needed
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("£",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  Text(min.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                  const Text(" - ",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                  const Text("£",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  Text(max.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                  const Gap(5),
                  Text(minMaxRate.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ));
    } else if (amount != null) {
      return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFDDEE), // Container color
              borderRadius:
                  BorderRadius.circular(4), // Adjust the radius as needed
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("£",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  Text(amount.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                  const Gap(5),
                  Text(amountRate.toString(),
                      style: const TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ));
    }
    return const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
    );
  }

  static Container buildLeftAttraction(bool? ongoingNeed) {
    if (ongoingNeed ?? false) {
      return Container(
        width: 160,
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFFFFE4E1), // Container color
          borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.black,
                    size: 15.0,
                  ),
                  Gap(5),
                  Text("One click apply",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 13,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_add,
                    color: Colors.black,
                    size: 15.0,
                  ),
                  Gap(5),
                  Text("One click apply",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 13,
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: 160,
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xFFFFE4E1), // Container color
          borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.black,
                    size: 15.0,
                  ),
                  Gap(5),
                  Text("One click apply",
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        color: Colors.black,
                        fontSize: 13,
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  static Container buildCenterAttraction(List<String>? jobSchedule) {
    if (jobSchedule == null || jobSchedule.isEmpty) {
      return Container();
    }
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E6FA), // Container color
        borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: jobSchedule.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 2),
              child: Text(jobSchedule[index],
                  style: const TextStyle(
                    fontFamily: 'Roboto-Medium',
                    color: Colors.black,
                    fontSize: 13,
                  )),
            );
          },
        ),
      ),
    );
  }

  static Container buildRightAttraction(List<String>? supplementalPay) {
    if (supplementalPay == null || supplementalPay.isEmpty) {
      return Container();
    }
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFAFEEEE), // Container color
        borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: supplementalPay.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 2),
              child: Text(supplementalPay[index],
                  style: const TextStyle(
                    fontFamily: 'Roboto-Medium',
                    color: Colors.black,
                    fontSize: 13,
                  )),
            );
          },
        ),
      ),
    );
  }

  static Row buildAllAttraction(fullJobModel jobObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: LeftJobViewUtils.buildLeftAttraction(jobObject.ongoingNeed),
        ),
        LeftJobViewUtils.buildCenterAttraction(jobObject.jobSchedule),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              LeftJobViewUtils.buildRightAttraction(jobObject.supplementalPay),
        ),
      ],
    );
  }

  static Padding buildJobDescription(String? jobDesc) {
    if (jobDesc == null || jobDesc.isEmpty) {
      return const Padding(
        padding: EdgeInsets.zero,
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 9, 43, 136), // Container color
          borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
        ),
        
        child: Html(data: '<p style="margin: 0; padding: 0;">$jobDesc'
        ),

        
      ),
    );
  }
}
