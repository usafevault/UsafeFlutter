// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet/core/bloc/collectible-bloc/cubit/collectible_cubit.dart';
import 'package:wallet/core/bloc/preference-bloc/cubit/preference_cubit.dart';
import 'package:wallet/core/bloc/token-bloc/cubit/token_cubit.dart';
import 'package:wallet/core/bloc/wallet-bloc/cubit/wallet_cubit.dart';
import 'package:wallet/core/locale_provider/cubit/locale_cubit.dart';
import 'package:wallet/core/model/coin_gecko_token_model.dart';
import 'package:wallet/core/model/collectible_model.dart';
import 'package:wallet/core/model/token_model.dart';
import 'package:wallet/ui/amount/amount_screen.dart';
import 'package:wallet/ui/block-web-view/block_web_view.dart';
import 'package:wallet/ui/collectibles/import_collectible_screen.dart';
import 'package:wallet/ui/home/home_screen.dart';
import 'package:wallet/ui/import-account/import_account_screen.dart';
import 'package:wallet/ui/login-screen/login_screen.dart';
import 'package:wallet/ui/onboard/create_wallet_screen.dart';
import 'package:wallet/ui/onboard/onboard_screen.dart';
import 'package:wallet/ui/onboard/wallet_setup_screen.dart';
import 'package:wallet/ui/onboard/component/create-password/bloc/create_wallet_cubit.dart';
import 'package:wallet/ui/setttings/general_settings_screen/general_settings_screen.dart';
import 'package:wallet/ui/setttings/security_settings_screen/security_settings_screen.dart';
import 'package:wallet/ui/setttings/settings_screen.dart';
import 'package:wallet/ui/swap_confirm_screen.dart/swap_confirm_screen.dart';
import 'package:wallet/ui/swap_screen/swap_screen.dart';
import 'package:wallet/ui/token-dashboard-screen/token_dashboard_screen.dart';
import 'package:wallet/ui/token/component/import_token.dart';
import 'package:wallet/ui/transaction-confirmation/transaction_confirmation.dart';
import 'package:wallet/ui/transaction-history/transaction_history_screen.dart';
import 'package:wallet/ui/transfer/transfer_screen.dart';
import 'package:wallet/ui/webview/web_view_screen.dart';

import 'constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  if (kIsWeb) {
    Hive..init("")..registerAdapter(TokenAdapter())..registerAdapter(CollectibleAdapter());
  } else {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive..init(appDocumentDirectory.path)..registerAdapter(TokenAdapter())..registerAdapter(CollectibleAdapter());
  }
  FlutterSecureStorage fss = const FlutterSecureStorage();
  String? wallet = await fss.read(key: "wallet");
  Widget? initialWidget;
  if (wallet != null) {
    initialWidget = const LoginScreen();
  } else {
    initialWidget = const OnboardScreen();
  }
  Box box = await Hive.openBox("user_preference");
  String locale = (await box.get("LOCALE")) ?? "en";
  log(initialWidget.toString());
  runApp(SizedBox(
    width: 200,
    child: MyApp(
      locale: locale,
      initialWidget: initialWidget,
      userPreferenceBox: box,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final Widget initialWidget;
  final String locale;
  final Box userPreferenceBox;

  const MyApp({Key? key, required this.initialWidget, required this.locale, required this.userPreferenceBox})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locale = "";

  @override
  void initState() {
    setState(() {
      locale = widget.locale;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateWalletCubit(),
        ),
        BlocProvider(
          create: (context) => WalletCubit(),
        ),
        BlocProvider(create: (context) => PreferenceCubit(userPreference: widget.userPreferenceBox)),
        BlocProvider(create: (context) => LocaleCubit(locale: locale)),
        BlocProvider(create: (context) => TokenCubit(userPreferenceBox: widget.userPreferenceBox)),
        BlocProvider(create: (context) => CollectibleCubit(userPreferenceBox: widget.userPreferenceBox))

      ],
      child: BlocConsumer<LocaleCubit, LocaleState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            locale: Locale.fromSubtags(
                languageCode:(state as LocaleInitial).locale),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData().copyWith(
                primaryColor: kPrimaryColor,
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                unselectedWidgetColor: kPrimaryColor),
            home: widget.initialWidget,
            initialRoute: OnboardScreen.route,
            onGenerateRoute: (setting) {
              if (setting.name == WalletSetupScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const WalletSetupScreen());
              }
              if (setting.name == SecuritySettingsScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const SecuritySettingsScreen());
              }
              if (setting.name == GeneralSettingsScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const GeneralSettingsScreen());
              }
              if (setting.name == ImportAccount.route) {
                return MaterialPageRoute(
                    builder: (context) => const ImportAccount());
              }
              if (setting.name == WebViewScreen.router) {
                String title = (setting.arguments as dynamic)["title"];
                String url = (setting.arguments as dynamic)["url"];
                return MaterialPageRoute(
                    builder: (context) =>  WebViewScreen(title: title, url: url));
              }
              if (setting.name == TransactionHistoryScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const TransactionHistoryScreen());
              }
              if (setting.name == CreateWalletScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const CreateWalletScreen());
              }
              if (setting.name == HomeScreen.route) {
                String password = (setting.arguments! as dynamic)["password"];
                return MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          password: password,
                        ));
              }
              if (setting.name == SettingsScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const SettingsScreen());
              }
              if (setting.name == SwapScreen.route) {
                return MaterialPageRoute(
                  builder: (context) => const SwapScreen(),
                );
              }
              if (setting.name == ImportTokenScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const ImportTokenScreen());
              }
              if (setting.name == ImportCollectibleScreen.route) {
                return MaterialPageRoute(
                    builder: (context) => const ImportCollectibleScreen());
              }
              if (setting.name == TransactionConfirmationScreen.route) {
                String to = (setting.arguments as dynamic)["to"];
                String from = (setting.arguments as dynamic)["from"];
                double value = (setting.arguments as dynamic)["value"];
                String? token = (setting.arguments as dynamic)["token"];
                String? contractAddress = (setting.arguments as dynamic)["contractAddress"];

                Collectible? collectible =
                    (setting.arguments as dynamic)["collectible"];

                double balance =
                    (setting.arguments as dynamic)["balance"] as double;
                return MaterialPageRoute(
                    builder: (context) => TransactionConfirmationScreen(
                          to: to,
                          from: from,
                          value: value,
                          balance: balance,
                          token: token,
                          contractAddress: contractAddress,
                          collectible: collectible,
                        ));
              }
              if (setting.name == AmountScreen.route) {
                double balance =
                    (setting.arguments as dynamic)["balance"] as double;
                String to = (setting.arguments as dynamic)["to"] as String;
                String from = (setting.arguments as dynamic)["from"] as String;
                Token token = (setting.arguments as dynamic)["token"] as Token;
                log(token.symbol.toString());
                return MaterialPageRoute(
                    builder: (context) => AmountScreen(
                          balance: balance,
                          to: to,
                          token: token,
                          from: from,
                        ));
              }
              if (setting.name == TransferScreen.route) {
                String balance = (setting.arguments as dynamic)["balance"];
                Token? token = (setting.arguments as dynamic)["token"];
                Collectible? collectible =
                    (setting.arguments as dynamic)["collectible"];

                return MaterialPageRoute(
                    builder: (context) => TransferScreen(
                          balance: token != null ? balance : "0",
                          token: token,
                          collectible: collectible,
                        
                        ));
              }
              if (setting.name == SwapConfirmScreen.route) {
                CoinGeckoToken tokenFrom =
                    (setting.arguments as dynamic)["tokenFrom"];
                CoinGeckoToken tokenTo =
                    (setting.arguments as dynamic)["tokenTo"];
                double tokenInAmount =
                    (setting.arguments as dynamic)["tokenInAmount"];
                BigInt tokenOutAmount =
                    (setting.arguments as dynamic)["tokenOutAmount"];
                BigInt fee = (setting.arguments as dynamic)["fee"];
                return MaterialPageRoute(
                    builder: (context) => SwapConfirmScreen(
                          tokenOutAmount: tokenOutAmount,
                          tokenFrom: tokenFrom,
                          fee: fee,
                          tokenTo: tokenTo,
                          tokenInAmount: tokenInAmount,
                        ));
              }
              if (setting.name == TokenDashboardScreen.route) {
                String token = (setting.arguments as dynamic)["token"];
                bool? isCollectible =
                    (setting.arguments as dynamic)["isCollectible"];
                String tokenId = (setting.arguments as dynamic)["tokenId"]  ?? "-1";

                return MaterialPageRoute(
                    builder: (context) => TokenDashboardScreen(
                          tokenAddress: token,
                          isCollectibles: isCollectible ?? false,
                          tokenId: tokenId,
                        ));
              }
              if (setting.name == BlockWebView.router) {
                BlockWebViewArg arguments =
                    BlockWebViewArg.fromObject(setting.arguments!);
                return MaterialPageRoute(
                  builder: (context) => BlockWebView(
                    title: arguments.title,
                    url: arguments.url,
                    isTransaction: arguments.isTransaction,
                  ),
                );
              }
              
              return null;
            },
          );
        },
      ),
    );
  }

  
}
