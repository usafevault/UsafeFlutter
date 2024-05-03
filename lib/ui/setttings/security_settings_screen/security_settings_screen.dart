

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/constant.dart';
import 'package:wallet/core/bloc/wallet-bloc/cubit/wallet_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallet/core/cubit_helper.dart';
import 'package:wallet/utils.dart';
import 'package:web3dart/crypto.dart';


class SecuritySettingsScreen extends StatefulWidget {
  static const route = "security_settings_screen";
  const SecuritySettingsScreen({Key? key}) : super(key: key);

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool showPrivateKey = false;
  int timeLeft = 5; // time in seconds
  bool isPressing = false;
  Timer? _timer;
  double progress = 0.0;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (timeLeft == 0) {
          setState(() {
            timer.cancel();
            copyAddressToClipBoard(bytesToHex(getWalletLoadedState(context).wallet.privateKey.privateKey), context);
            showPrivateKey = true; // reveal the private key
          });
        } else {
          setState(() {
            timeLeft--;
            progress += 1.0 / 5.0; // update progress based on your total time
          });
        }
      },
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: kPrimaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title:  Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 70, 10),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.security,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                 Row(
                   children: [
                     Text(
                      AppLocalizations.of(context)!.showPrivateKey,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                     ),
                     SizedBox(width: 20,),
                     if (isPressing)
                     Stack(
                       alignment: Alignment.center,
                       children: [
                         SizedBox(
                           width: 25,
                           height: 25,
                           child: CircularProgressIndicator(
                             value: progress, // current progress
                             backgroundColor: Colors.grey[300],
                             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                           ),
                         ),
                         Text("$timeLeft",style: TextStyle(fontSize: 10),),
                       ],
                     ),

                   ],
                 ),
                const SizedBox(
                  height: 7,
                ),
                 GestureDetector(
                   onLongPress: () {
                     setState(() {
                       isPressing = true;
                       timeLeft = 5; // reset timer
                       progress = 0.0; // reset progress
                       showPrivateKey = false; // hide the private key
                     });
                     startTimer();
                   },
                   onLongPressUp: () { // reset everything if the user releases the press
                     _timer?.cancel();
                     setState(() {
                       isPressing = false;
                       if(timeLeft != 0)
                         {
                           timeLeft = 5;
                           progress = 0.0;
                           showPrivateKey = false;
                         }

                     });
                   },

                   child: FittedBox(
                     child: Text(
                         !showPrivateKey ?
                        AppLocalizations.of(context)!.tapHereToReveal : bytesToHex(getWalletLoadedState(context).wallet.privateKey.privateKey),
                       style: TextStyle(fontSize: 20),

                     ),
                   ),
                 ),
                const SizedBox(
                  height: 7,
                ),
                const SizedBox(
                  height: 20,
                
                ),
                const SizedBox(
                  height: 7,
                )
                
                // FutureBuilder<List<String>?>(
                //     future: getSupportedVsCurrency(),
                //     builder: (context, snapshot) {
                //       return DropdownButtonHideUnderline(
                //           child: Container(
                //         padding: const EdgeInsets.symmetric(horizontal: 10),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             border: Border.all(width: 1, color: kPrimaryColor)),
                //         child: DropdownButton<String>(
                //             isExpanded: true,
                //             value: vsCurrency,
                //             items: snapshot.data
                //                 ?.map<DropdownMenuItem<String>>(
                //                     (e) => DropdownMenuItem<String>(
                //                           value: e,
                //                           child: Text(e.toUpperCase()),
                //                         ))
                //                 .toList(),
                //             onChanged: (value) => {
                //                   setState(() {
                //                     vsCurrency = value!;
                //                   })
                //                 }),
                //       ));
                //     })
              ],
            ),
          ),
        );
      },
    );
  }
}