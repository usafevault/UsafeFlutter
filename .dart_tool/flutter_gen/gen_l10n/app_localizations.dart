import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'U-SAFE'**
  String get appName;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @currentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Current language'**
  String get currentLanguage;

  /// No description provided for @trusedByMillion.
  ///
  /// In en, this message translates to:
  /// **'Trused by Million'**
  String get trusedByMillion;

  /// No description provided for @safeReliableSuperfast.
  ///
  /// In en, this message translates to:
  /// **'Safe, Reliable and Superfast'**
  String get safeReliableSuperfast;

  /// No description provided for @youKeyToExploreWeb3.
  ///
  /// In en, this message translates to:
  /// **'Your key to explore Web3'**
  String get youKeyToExploreWeb3;

  /// No description provided for @template1.
  ///
  /// In en, this message translates to:
  /// **'Here you can write the description of the page,  to explain something...'**
  String get template1;

  /// No description provided for @template2.
  ///
  /// In en, this message translates to:
  /// **'Here you can write the description of the page,  to explain something...'**
  String get template2;

  /// No description provided for @template3.
  ///
  /// In en, this message translates to:
  /// **'Here you can write the description of the page,  to explain something...'**
  String get template3;

  /// No description provided for @walletSetup.
  ///
  /// In en, this message translates to:
  /// **'Wallet setup'**
  String get walletSetup;

  /// No description provided for @importAnExistingWalletOrCreate.
  ///
  /// In en, this message translates to:
  /// **'Import an existing wallet or create a new one'**
  String get importAnExistingWalletOrCreate;

  /// No description provided for @importUsingSecretRecoveryPhrase.
  ///
  /// In en, this message translates to:
  /// **'Import using Secret Recovery Phrase'**
  String get importUsingSecretRecoveryPhrase;

  /// No description provided for @createANewWallet.
  ///
  /// In en, this message translates to:
  /// **'Create a new wallet'**
  String get createANewWallet;

  /// No description provided for @createWallet.
  ///
  /// In en, this message translates to:
  /// **'Create personal vault'**
  String get createWallet;

  /// No description provided for @importAccount.
  ///
  /// In en, this message translates to:
  /// **'Import account'**
  String get importAccount;

  /// No description provided for @secretRecoveryPhrase.
  ///
  /// In en, this message translates to:
  /// **'Secret Recovery Phrase'**
  String get secretRecoveryPhrase;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @importWallet.
  ///
  /// In en, this message translates to:
  /// **'Import Wallet'**
  String get importWallet;

  /// No description provided for @passPhraseNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Passpharse shouldn\'t be empty'**
  String get passPhraseNotEmpty;

  /// No description provided for @passwordNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Passwored shouldn\'t be empty'**
  String get passwordNotEmpty;

  /// No description provided for @enterYourSecretRecoveryPharse.
  ///
  /// In en, this message translates to:
  /// **'Enter your Secret Recovery Phrase'**
  String get enterYourSecretRecoveryPharse;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @secureWallet.
  ///
  /// In en, this message translates to:
  /// **'Secure wallet'**
  String get secureWallet;

  /// No description provided for @createPassword.
  ///
  /// In en, this message translates to:
  /// **'Create password'**
  String get createPassword;

  /// No description provided for @confirmSeed.
  ///
  /// In en, this message translates to:
  /// **'Confirm seed'**
  String get confirmSeed;

  /// No description provided for @thisPasswordWill.
  ///
  /// In en, this message translates to:
  /// **'This password will unlock your wallet only on this device.'**
  String get thisPasswordWill;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @mustBeAtleast.
  ///
  /// In en, this message translates to:
  /// **'Must be atleast 8 character'**
  String get mustBeAtleast;

  /// No description provided for @passwordMustContain.
  ///
  /// In en, this message translates to:
  /// **'Password must contain atleast 8 characters'**
  String get passwordMustContain;

  /// Greet the user by their name.
  ///
  /// In en, this message translates to:
  /// **'I understand the {appName} cannot recover this password for me.'**
  String iUnserstandTheRecover(String appName);

  /// No description provided for @thisFieldNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'This filed shouldn\'t be empty'**
  String get thisFieldNotEmpty;

  /// No description provided for @writeSecretRecoveryPhrase.
  ///
  /// In en, this message translates to:
  /// **'Write down your Secret Recovery Phrase'**
  String get writeSecretRecoveryPhrase;

  /// No description provided for @yourSecretRecoveryPhrase.
  ///
  /// In en, this message translates to:
  /// **'This is your Secret RecoveryPhrase. Write it down on a paper and keep it in a safe place. You\'ll be asked to re-enter this phrase (in order) on the next step'**
  String get yourSecretRecoveryPhrase;

  /// No description provided for @tapToReveal.
  ///
  /// In en, this message translates to:
  /// **'Tap to reveal you Secret Recovery Phrase'**
  String get tapToReveal;

  /// No description provided for @makeSureNoOneWatching.
  ///
  /// In en, this message translates to:
  /// **'Make sure no one is watching your screen'**
  String get makeSureNoOneWatching;

  /// No description provided for @continueT.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueT;

  /// No description provided for @selectEachWord.
  ///
  /// In en, this message translates to:
  /// **'Select each word in the order it was presented to you'**
  String get selectEachWord;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @receive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @swap.
  ///
  /// In en, this message translates to:
  /// **'Spot trade'**
  String get swap;

  /// No description provided for @deleteWallet.
  ///
  /// In en, this message translates to:
  /// **'Delete Wallet'**
  String get deleteWallet;

  /// No description provided for @tokens.
  ///
  /// In en, this message translates to:
  /// **'Tokens'**
  String get tokens;

  /// No description provided for @collectibles.
  ///
  /// In en, this message translates to:
  /// **'Collectibles'**
  String get collectibles;

  /// No description provided for @dontSeeYouToken.
  ///
  /// In en, this message translates to:
  /// **'Don\'t see your tokens?'**
  String get dontSeeYouToken;

  /// No description provided for @importTokens.
  ///
  /// In en, this message translates to:
  /// **'Import Tokens'**
  String get importTokens;

  /// No description provided for @scanAddressto.
  ///
  /// In en, this message translates to:
  /// **'Scan adress to receive payment'**
  String get scanAddressto;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @requestPayment.
  ///
  /// In en, this message translates to:
  /// **'Request Payment'**
  String get requestPayment;

  /// No description provided for @dontSeeYouCollectible.
  ///
  /// In en, this message translates to:
  /// **'Don\'t see your NFTs?'**
  String get dontSeeYouCollectible;

  /// No description provided for @importCollectible.
  ///
  /// In en, this message translates to:
  /// **'Import NFT'**
  String get importCollectible;

  /// No description provided for @importTokensLowerCase.
  ///
  /// In en, this message translates to:
  /// **'Import tokens'**
  String get importTokensLowerCase;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @customTokens.
  ///
  /// In en, this message translates to:
  /// **'Custom Token'**
  String get customTokens;

  /// No description provided for @thisFeatureInMainnet.
  ///
  /// In en, this message translates to:
  /// **'This feature only available on mainnet'**
  String get thisFeatureInMainnet;

  /// No description provided for @anyoneCanCreate.
  ///
  /// In en, this message translates to:
  /// **'Anyone can create a token, including creating fake versions of existing tokens. Learn more about scams and security risks'**
  String get anyoneCanCreate;

  /// No description provided for @tokenAddress.
  ///
  /// In en, this message translates to:
  /// **'Token address'**
  String get tokenAddress;

  /// No description provided for @tokenSymbol.
  ///
  /// In en, this message translates to:
  /// **'Token symbol'**
  String get tokenSymbol;

  /// No description provided for @tokenDecimal.
  ///
  /// In en, this message translates to:
  /// **'Token Decimal'**
  String get tokenDecimal;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// No description provided for @top20Token.
  ///
  /// In en, this message translates to:
  /// **'Top ERC token'**
  String get top20Token;

  /// No description provided for @importToken.
  ///
  /// In en, this message translates to:
  /// **'Import token'**
  String get importToken;

  /// No description provided for @tokenAddedSuccesfully.
  ///
  /// In en, this message translates to:
  /// **'Token added successfully'**
  String get tokenAddedSuccesfully;

  /// No description provided for @collectibleAddedSuccesfully.
  ///
  /// In en, this message translates to:
  /// **'Collectible added successfully'**
  String get collectibleAddedSuccesfully;

  /// No description provided for @tokenName.
  ///
  /// In en, this message translates to:
  /// **'Token name'**
  String get tokenName;

  /// No description provided for @tokenID.
  ///
  /// In en, this message translates to:
  /// **'Token ID'**
  String get tokenID;

  /// No description provided for @nftOwnedSomeone.
  ///
  /// In en, this message translates to:
  /// **'NFT is owned by someone, You can only import NFT that you owned'**
  String get nftOwnedSomeone;

  /// No description provided for @nftDeleted.
  ///
  /// In en, this message translates to:
  /// **'NFT deleted successfully'**
  String get nftDeleted;

  /// No description provided for @youHaveNoTransaction.
  ///
  /// In en, this message translates to:
  /// **'You have not transaction'**
  String get youHaveNoTransaction;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @searchPublicAddress.
  ///
  /// In en, this message translates to:
  /// **'Search public address (0x), or ENS'**
  String get searchPublicAddress;

  /// No description provided for @transferBetweenMy.
  ///
  /// In en, this message translates to:
  /// **'Transfer between my accounts'**
  String get transferBetweenMy;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @useMax.
  ///
  /// In en, this message translates to:
  /// **'Use MAX'**
  String get useMax;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @likelyIn30Second.
  ///
  /// In en, this message translates to:
  /// **'Likely in < 30 seconds'**
  String get likelyIn30Second;

  /// No description provided for @likelyIn15Second.
  ///
  /// In en, this message translates to:
  /// **'Likely in 15 seconds'**
  String get likelyIn15Second;

  /// No description provided for @mayBeIn30Second.
  ///
  /// In en, this message translates to:
  /// **'Maybe in 30 seconds'**
  String get mayBeIn30Second;

  /// No description provided for @estimatedGasFee.
  ///
  /// In en, this message translates to:
  /// **'Estimated gas fee'**
  String get estimatedGasFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @maxFee.
  ///
  /// In en, this message translates to:
  /// **'Max fee'**
  String get maxFee;

  /// No description provided for @maxAmount.
  ///
  /// In en, this message translates to:
  /// **'Max amount'**
  String get maxAmount;

  /// No description provided for @transactionFailed.
  ///
  /// In en, this message translates to:
  /// **'Transaction failed'**
  String get transactionFailed;

  /// No description provided for @transactionSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Transaction submitted'**
  String get transactionSubmitted;

  /// No description provided for @confirmAndApprove.
  ///
  /// In en, this message translates to:
  /// **'Confirm and Approve'**
  String get confirmAndApprove;

  /// No description provided for @waitingForConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Waiting for confirmation'**
  String get waitingForConfirmation;

  /// No description provided for @editPriority.
  ///
  /// In en, this message translates to:
  /// **'Edit priority'**
  String get editPriority;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @advanceOptions.
  ///
  /// In en, this message translates to:
  /// **'Advance options'**
  String get advanceOptions;

  /// No description provided for @howShouldIChoose.
  ///
  /// In en, this message translates to:
  /// **'How should I choose'**
  String get howShouldIChoose;

  /// No description provided for @gasLimit.
  ///
  /// In en, this message translates to:
  /// **'Gas limit'**
  String get gasLimit;

  /// No description provided for @maxPriorityGwei.
  ///
  /// In en, this message translates to:
  /// **'Max priority fee (GWEI)'**
  String get maxPriorityGwei;

  /// No description provided for @maxFeeSwei.
  ///
  /// In en, this message translates to:
  /// **'Max fee (GWEI)'**
  String get maxFeeSwei;

  /// No description provided for @confirmTrasaction.
  ///
  /// In en, this message translates to:
  /// **'Confirm transaction'**
  String get confirmTrasaction;

  /// No description provided for @selectTokenToSwap.
  ///
  /// In en, this message translates to:
  /// **'Select Token to swap'**
  String get selectTokenToSwap;

  /// No description provided for @selectaToken.
  ///
  /// In en, this message translates to:
  /// **'Select a token'**
  String get selectaToken;

  /// No description provided for @getQuotes.
  ///
  /// In en, this message translates to:
  /// **'Get quotes'**
  String get getQuotes;

  /// No description provided for @convertFrom.
  ///
  /// In en, this message translates to:
  /// **'Convert from'**
  String get convertFrom;

  /// No description provided for @convertTo.
  ///
  /// In en, this message translates to:
  /// **'Convert to'**
  String get convertTo;

  /// No description provided for @enterTokenName.
  ///
  /// In en, this message translates to:
  /// **'Enter token name'**
  String get enterTokenName;

  /// No description provided for @newQuoteIn.
  ///
  /// In en, this message translates to:
  /// **'New quote in'**
  String get newQuoteIn;

  /// No description provided for @availableToSwap.
  ///
  /// In en, this message translates to:
  /// **'available to swap'**
  String get availableToSwap;

  /// No description provided for @swipeToSwap.
  ///
  /// In en, this message translates to:
  /// **'Swipe to swap'**
  String get swipeToSwap;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @viewOnEtherscan.
  ///
  /// In en, this message translates to:
  /// **'View on Explorer'**
  String get viewOnEtherscan;

  /// No description provided for @shareMyPubliAdd.
  ///
  /// In en, this message translates to:
  /// **'Share my Public Address'**
  String get shareMyPubliAdd;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @getHelp.
  ///
  /// In en, this message translates to:
  /// **'Get Help'**
  String get getHelp;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @explorer.
  ///
  /// In en, this message translates to:
  /// **'Explorer'**
  String get explorer;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @generalDescription.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion, primary currency, language and search engine'**
  String get generalDescription;

  /// No description provided for @networks.
  ///
  /// In en, this message translates to:
  /// **'Networks'**
  String get networks;

  /// No description provided for @networksDescription.
  ///
  /// In en, this message translates to:
  /// **'Add and edit custom RPC networks'**
  String get networksDescription;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'Add, edit, remove and manage you accounts'**
  String get contactDescription;

  /// about
  ///
  /// In en, this message translates to:
  /// **'About {appName}'**
  String about(String appName);

  /// No description provided for @currencyConversion.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion'**
  String get currencyConversion;

  /// No description provided for @displayFiat.
  ///
  /// In en, this message translates to:
  /// **'Display fiat values in using a specific currency throughout the application'**
  String get displayFiat;

  /// No description provided for @languageDescription.
  ///
  /// In en, this message translates to:
  /// **'Translate the application to a different supported language'**
  String get languageDescription;

  /// No description provided for @createNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create New Account'**
  String get createNewAccount;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @securityDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage privatekey and export wallet'**
  String get securityDescription;

  /// No description provided for @showPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Show private key'**
  String get showPrivateKey;

  /// No description provided for @tapHereToReveal.
  ///
  /// In en, this message translates to:
  /// **'Tap and hold to reveal and copy private key'**
  String get tapHereToReveal;

  /// No description provided for @exportWallet.
  ///
  /// In en, this message translates to:
  /// **'Export wallet'**
  String get exportWallet;

  /// No description provided for @tapHereToExportWallet.
  ///
  /// In en, this message translates to:
  /// **'Tap and hold to export wallet (Your current password is used for import)'**
  String get tapHereToExportWallet;

  /// No description provided for @browser.
  ///
  /// In en, this message translates to:
  /// **'Browser'**
  String get browser;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
