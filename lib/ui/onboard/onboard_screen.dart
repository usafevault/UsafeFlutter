import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:new_version/new_version.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet/config.dart';
import 'package:wallet/ui/onboard/wallet_setup_screen.dart';
import 'package:wallet/ui/shared/wallet_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:in_app_update/in_app_update.dart';

class OnboardScreen extends StatefulWidget {
  static String route = "onboard_screen";
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  int index = 0;

  @override
  void initState() {
    try {
      if (Platform.isAndroid) {
        InAppUpdate.checkForUpdate().then((update) {
          if (update.updateAvailability == UpdateAvailability.updateAvailable) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  title: const Text("Update available"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Available version: ${update.availableVersionCode}'),
                      const SizedBox(
                        height: 20,
                      ),
                      WalletButton(
                          textContent: "Update",
                          onPressed: () {
                            InAppUpdate.performImmediateUpdate()
                                .catchError((e) => log(e.toString()));
                          })
                    ],
                  ),
                ),
              ),
            );
          }
        }).catchError((e) {
          log(e.toString());
        });
      }
      if (Platform.isIOS) {
        final newVersion = NewVersion();
        newVersion.getVersionStatus().then((status) {
          if (status != null && status.canUpdate) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  title: const Text("Update available"),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                          "New version of $appName is available on App Store."),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Current version: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(status.localVersion),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Available version: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(status.storeVersion),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "What's new :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(status.releaseNotes ??
                          "Improved performance and stability."),
                      const SizedBox(
                        height: 20,
                      ),
                      WalletButton(
                          textContent: "Update",
                          onPressed: () async {
                            log(status.appStoreLink);
                            if (!await launchUrl(
                              Uri.parse(status.appStoreLink),
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw 'Could not launch ${status.appStoreLink}';
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          }
        }).catchError((e) {
          log(e.toString());
        });
      }
    } catch (e) {
      log(e.toString());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pageList = [
      PageViewModel(
        title: "",
        body:
        "",
        image: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/1.png"))
        ),
      ),
      PageViewModel(
        title: "",
        body:
        "",
        image: Center(
            child: SizedBox(
                height: 200,
                child: Image.asset("assets/images/2.png"))
        ),
      ),
      PageViewModel(
        title: "",
        body:
        "",
        image: Center(
            child: SizedBox(
                height: 200,
                child: Image.asset("assets/images/3.png"))
        ),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          if(index == 0)
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("assets/images/1.png",),fit: BoxFit.fill)
             ),
           ),
          if(index == 1)
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/2.png",),fit: BoxFit.fill)
              ),
            ),
          if(index == 2)
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/3.png",),fit: BoxFit.fill)
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(bottom: 15,left: 40,right: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: WalletButton(
                textContent:index == 2? AppLocalizations.of(context)!.getStarted:"Next",
                // textContent: "",
                onPressed: () {
                    if(index<2)
                      {
                        setState(() {
                          index ++;
                        });

                      }
                    else
                      {
                        Navigator.of(context).pushNamed(WalletSetupScreen.route);
                      }



                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
