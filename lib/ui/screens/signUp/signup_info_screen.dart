import 'package:flutter/material.dart';

import '../../widgets/loading_request.dart';
import 'login_screen.dart';

class SignUpInfo extends StatefulWidget {
  final TabController tabController;

  const SignUpInfo({Key? key, required this.tabController}) : super(key: key);

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  int selectedGender = -1;
  TextEditingController cinController = TextEditingController();
  String cinError = '';
  String genderError = '';
  bool _loading = false;
  bool bottomSheetHeight = true;
  @override
  void initState() {
    super.initState();
    selectedGender = -1;
    cinController.text = '';
    cinError = '';
    genderError = '';
    _loading = false;
    bottomSheetHeight = true;
  }

  bool validateData() {
    setState(() {
      cinError = '';
    });

    if (cinController.text.isEmpty) {
      setState(() {
        cinError = 'Please enter your cin';
      });
      return false;
    }

    double cin = double.tryParse(cinController.text) ?? 0.0;

    if (cin > 99999999 || cin < 100000) {
      setState(() {
        cinError = 'Invalid cin ';
      });
      return false;
    }

    if (selectedGender == -1) {
      genderError = 'please select Gender';
      return false;
    }

    return true;
  }

  void continueCallback() async {
    if (validateData()) {
      setState(() {
        _loading = true;
      });

      ///call with back

      setState(() {
        _loading = false;
        bottomSheetHeight = false;
      });
      await Future.delayed(const Duration(milliseconds: 300));
      if (context.mounted) {
        showModalBottomSheet(
          isScrollControlled: true,
          barrierColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          context: context,
          builder: (context) => const LoginScreen(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Text(
              'Basic Information : ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: deviceWidth * 0.06,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: deviceHeight * 0.04),
                    child: Text(
                      'Cin :',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.05,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1CAAC9),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.13,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                    width: deviceWidth * 0.55,
                    child: TextField(
                      controller: cinController,
                      maxLines: 1,
                      minLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Cin',
                        hintStyle: TextStyle(
                          fontSize: deviceWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF1CAAC9)),
                          borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                          gapPadding: 0,
                        ),
                        fillColor: Colors.white,
                        errorMaxLines: 1,
                        isDense: true,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                          gapPadding: 0,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                          gapPadding: 0,
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: deviceWidth * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    'Gender :',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.05,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1CAAC9),
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.03,
                  ),
                  Container(
                    width: deviceWidth * 0.6,
                    height: deviceWidth * 0.13,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(deviceWidth * 0.064),
                      border: Border.all(color: const Color(0xFF1CAAC9), width: 1.0),
                      // gradient: Brand.mainGradientVertical,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 1;
                              });
                            },
                            child: Container(
                              height: deviceWidth * 0.133,
                              decoration: BoxDecoration(
                                color: selectedGender != 1 ? Colors.white : const Color(0xFF1CAAC9),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(deviceWidth * 0.064),
                                  topLeft: Radius.circular(deviceWidth * 0.064),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'male',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: deviceWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(color: Colors.grey, width: 1),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 2;
                              });
                            },
                            child: Container(
                              height: deviceWidth * 0.133,
                              decoration: BoxDecoration(
                                color: selectedGender != 2 ? Colors.white : const Color(0xFF1CAAC9),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(deviceWidth * 0.064),
                                  topRight: Radius.circular(deviceWidth * 0.064),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'female',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: deviceWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Visibility(
              visible: cinError.isNotEmpty || genderError.isNotEmpty,
              child: Center(
                child: Text(
                  cinError.isNotEmpty ? cinError : genderError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: deviceWidth * 0.03,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            GestureDetector(
              onTap: continueCallback,
              child: Center(
                child: Container(
                  height: deviceHeight * 0.05,
                  width: deviceWidth * 0.4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1CAAC9),
                    borderRadius: BorderRadius.all(
                      Radius.circular(deviceWidth * 0.05),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_loading) const LoadingRequest()
      ],
    );
  }
}
