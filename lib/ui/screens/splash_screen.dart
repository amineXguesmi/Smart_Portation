import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:transportation/ui/screens/signUp/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  bool bottomSheetHeight = true;

  @override
  void initState() {
    super.initState();
    bottomSheetHeight = true;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    setState(() {
      bottomSheetHeight = bottomInset - context.size!.height * 0.1 == 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF30749F),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 50),
                padding: EdgeInsets.only(bottom: deviceHeight * 0.34),
                child: const RiveAnimation.asset(
                  'assets/car.riv',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: bottomSheetHeight ? deviceHeight * 0.5 : 0,
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(deviceWidth * 0.1),
                    topLeft: Radius.circular(deviceWidth * 0.1),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.02,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.14,
                        width: deviceWidth * 0.9,
                        child: Image.asset(
                          '',
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      ),
                      SizedBox(
                        child: Text(
                          'Slogon!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: const Color(0xFF1CAAC9), fontSize: deviceWidth * 0.05),
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.05,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
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
                        },
                        child: Container(
                          height: deviceHeight * 0.07,
                          width: deviceWidth * 0.5,
                          decoration: BoxDecoration(
                            color: const Color(0xFF30749F),
                            borderRadius: BorderRadius.all(
                              Radius.circular(deviceWidth * 0.08),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Start',
                              style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
