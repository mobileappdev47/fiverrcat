// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers



import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:pokercat/addexpense/db/models/currency/curency_model.db.dart';
import 'package:pokercat/constant.dart';
import 'package:pokercat/global/component/appbar.dart';

import '../../../addexpense/db/functions/currency_function.dart';

class CurencySelection extends StatefulWidget {
  const CurencySelection({super.key});

  @override
  State<CurencySelection> createState() => _CurencySelectionState();
}

class _CurencySelectionState extends State<CurencySelection> {
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _currencySymbolController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pcScafoldColor,
      appBar: Appbar(
        titleStr: 'Curreny Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 80,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Change ',
                              style: TextStyle(
                                  color: AppTheme.pcTextTertiaryColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              } else {
                                return null;
                              }
                            },
                            controller: _currencyController,
                            cursorColor: AppTheme.pcTextSecondayColor,
                            style: const TextStyle(
                              color: AppTheme.pcTextSecondayColor,
                            ),
                            decoration: InputDecoration(
                              suffixText: _currencySymbolController.text,
                              suffixStyle: const TextStyle(
                                color: AppTheme.pcTextSecondayColor,
                                fontSize: 16,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTheme.pcTabBarSelectorColor,
                                ),
                              ),
                            ),
                            onTap: () {
                              showCurrencyPicker(
                                context: context,
                                theme: CurrencyPickerThemeData(
                                  backgroundColor: AppTheme.pcScafoldColor,
                                  currencySignTextStyle: const TextStyle(
                                      fontSize: 17,
                                      color: AppTheme.pcTextSecondayColor),
                                  flagSize: 20,
                                  titleTextStyle: const TextStyle(
                                      fontSize: 17,
                                      color: AppTheme.pcTextSecondayColor),
                                  subtitleTextStyle: const TextStyle(
                                      fontSize: 14,
                                      color: AppTheme.pcTextTertiaryColor),
                                  bottomSheetHeight:
                                      MediaQuery.of(context).size.height / 1.5,
                                ),
                                physics: const BouncingScrollPhysics(),
                                showFlag: true,
                                showSearchField: false,
                                showCurrencyName: true,
                                showCurrencyCode: true,
                                onSelect: (Currency currency) {
                                  setState(() {
                                    _currencyController.text = currency.name;
                                    _currencySymbolController.text =
                                        currency.symbol;
                                  });
                                  print('Select currency: ${currency.name}');
                                },
                                currencyFilter: <String>[
                                  'INR',
                                  'USD',
                                  'EUR',
                                  'JPY',
                                  'GBP',
                                  'AUD',
                                  'CAD',
                                  'CNY',
                                  'HKD',
                                  'NZD',
                                  'KRW',
                                  'SGD',
                                  'MXN',
                                  'RUB',
                                  'TRY',
                                  'THB',
                                  'ILS',
                                  'CLP',
                                  'PHP',
                                  'AED',
                                  'COP',
                                  'SAR',
                                  'DZD',
                                  'ARS',
                                  'AMD',
                                  'AZN',
                                  'BBD',
                                  'BMD',
                                  'BND',
                                  'KHR',
                                  'KYD',
                                  'CRC',
                                  'EGP',
                                  'GEL',
                                  'GHS',
                                  'GYD',
                                  'JOD',
                                  'KWD',
                                  'LAK',
                                  'LRD',
                                  'MNT',
                                  'NAD',
                                  'NGN',
                                  'OMR',
                                  'PYG',
                                  'QAR',
                                  'SRD',
                                  'UAH',
                                  'VND',
                                  'YER'
                                ],
                              );
                            },
                            readOnly: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.pcTextPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    onAddCurrencySavedButton();
                    _currencyController.clear();
                    _currencySymbolController.clear();
                  });
                  getCurrency();
                }
              },
              child: const Text(
                '             Update               ',
                style: TextStyle(
                  color: AppTheme.pcTextSecondayColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: currencyNotifier,
                builder: (BuildContext ctx, List<CurrencyModel> value,
                    Widget? child) {
                  return value.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.length,
                          itemBuilder: (ctx, index) {
                            final data = value[index];
                            return Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 200,
                                  child: Text(
                                    data.symbol,
                                    style: const TextStyle(
                                        fontSize: 80,
                                        color: AppTheme.pcTextSecondayColor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  child: Text(
                                    data.cuntry,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: AppTheme.pcTextSecondayColor),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 200,
                              child: const Text(
                                "₩",
                                style: TextStyle(
                                    fontSize: 80,
                                    color: AppTheme.pcTextSecondayColor),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              child: const Text(
                                'Default Currency - South Korea Won',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppTheme.pcTextSecondayColor),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddCurrencySavedButton() async {
    final _currencyUpdate = CurrencyModel(
        id: '1',
        cuntry: _currencyController.text.trim(),
        symbol: _currencySymbolController.text.trim());
    addCurrency(_currencyUpdate);
    _currencyController.clear();
    _currencySymbolController.clear();
    getAllCurrency();
  }
}
