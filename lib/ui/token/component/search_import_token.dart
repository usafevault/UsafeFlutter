import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/constant.dart';
import 'package:wallet/core/bloc/token-bloc/cubit/token_cubit.dart';
import 'package:wallet/core/bloc/wallet-bloc/cubit/wallet_cubit.dart';
import 'package:wallet/core/core.dart';
import 'package:wallet/core/cubit_helper.dart';
import 'package:wallet/core/model/token_model.dart';
import 'package:wallet/ui/home/component/avatar_component.dart';
import 'package:wallet/ui/shared/wallet_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchImportToken extends StatefulWidget {
  const SearchImportToken({Key? key}) : super(key: key);

  @override
  State<SearchImportToken> createState() => _SearchImportTokenState();
}

class _SearchImportTokenState extends State<SearchImportToken> {
  TextEditingController searchToken = TextEditingController();
  Token? selectedToken;
 List topERC20Tokens = [];
  @override
  void initState() {
    searchToken.addListener(() {});
    setState(() {
      topERC20Tokens =  getWalletLoadedState(context)
          .currentNetwork
          .networkName == 'Polygon Mainnet'? Core.topERC20TokensPolygon:
      getWalletLoadedState(context)
          .currentNetwork
          .networkName == 'Binance Smart Chain'?
      Core.topERC20TokensBsc
          :
      getWalletLoadedState(context)
          .currentNetwork
          .networkName == 'Mumbai testnet'?
      Core.topERC20TokensMumbai:
      getWalletLoadedState(context)
          .currentNetwork
          .networkName == 'Core Mainnet'?
          Core.topERC20TokensCore
          :
      Core.topERC20Tokens;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {},
      builder: (context, state) {
        return (state as WalletLoaded).currentNetwork.isMainnet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppLocalizations.of(context)!.top20Token,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: topERC20Tokens.length,
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: selectedToken?.tokenAddress ==
                                              topERC20Tokens[index]
                                                  .tokenAddress
                                          ? kPrimaryColor
                                          : Colors.grey.withAlpha(60)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedToken?.tokenAddress ==
                                          topERC20Tokens[index]
                                              .tokenAddress
                                      ? kPrimaryColor.withAlpha(70)
                                      : Colors.transparent,
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  onTap: () {
                                    setState(() {
                                      selectedToken =
                                          topERC20Tokens[index];
                                    });
                                  },
                                  // tileColor: Colors.red,
                                  leading: AvatarWidget(
                                      radius: 40,
                                      imageUrl:
                                          topERC20Tokens[index].imageUrl,
                                      address: topERC20Tokens[index].tokenAddress),
                                  title:
                                      Text(topERC20Tokens[index].symbol),
                                ),
                              ))),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<TokenCubit, TokenState>(
                    listener: (context, state) {
                      if (state is TokenAdded) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context)
                            .showSnackBar( SnackBar(
                          content: Text(AppLocalizations.of(context)!.tokenAddedSuccesfully),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    builder: (context, state) {
                      return WalletButton(
                          type: WalletButtonType.filled,
                          textContent: AppLocalizations.of(context)!.importToken,
                          onPressed: selectedToken != null
                              ? () {
                                  context.read<TokenCubit>().addToken(
                                      address: getWalletLoadedState(context)
                                          .wallet
                                          .privateKey
                                          .address
                                          .hex,
                                      network: getWalletLoadedState(context)
                                          .currentNetwork,
                                      token: selectedToken!);
                                }
                              : null);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              )
            :  Center(
                child: Text(AppLocalizations.of(context)!.thisFeatureInMainnet),
              );
      },
    );
  }
}
