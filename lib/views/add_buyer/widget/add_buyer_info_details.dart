import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../utils/app_config.dart';
import '../../../utils/phone_number_input_formatter.dart';
import '../../../widgets/suggestion_field/suggestion_field_configuration.dart';
import '../../../widgets/suggestion_field/suggestions_box/suggestions_box_decoration.dart';
import '../../../widgets/suggestion_field/text_field_with_dropdown.dart';
import '../../../widgets/suggestion_field_item.dart';
import '../../../widgets/text_field_widget.dart';
import '../../buyers_sellers/model/buyer_seller_info.dart';
import '../add_buyer_provider.dart';

class BuyerDetails extends StatelessWidget {
  final AppLocalizations localizationsContext;
  final AddBuyerProvider addBuyerProvider;

  const BuyerDetails({
    Key? key,
    required this.localizationsContext,
    required this.addBuyerProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<AddBuyerProvider, TextEditingController>(
          selector: (_, state) => state.buyerNameFieldController,
          builder: (context, controller, child) {
            return TextFieldWithDropdown(
              getImmediateSuggestions: false,
              hideOnEmpty: true,
              hideKeyboardOnDrag: false,
              hideSuggestionsOnKeyboardHide: false,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.borderRadius.r,
                ),
              ),
              textFieldConfiguration: SuggestionFieldConfiguration(
                controller: controller,
                label: '${localizationsContext.buyerName}*',
                suffixIconPath: Strings.iconPhoneBook,
                onSuffixIconClick: () =>
                    addBuyerProvider.openContactsToPickPhone(),
                onChanged: (value) {
                  addBuyerProvider.validateBuyerData();
                },
              ),
              suggestionsCallback: (pattern) {
                return addBuyerProvider.getFilteredBuyers(pattern);
              },
              loadingBuilder: (context) => SizedBox(),
              noItemsFoundBuilder: (context) => SizedBox(),
              itemBuilder: (context, BuyerSellerInfo suggestion, bool showDivider) {
                return SuggestionItemWidget(
                  title: suggestion.name!,
                  subtitle: suggestion.phone,
                  showDivider: showDivider,
                );
              },
              onSuggestionSelected: (BuyerSellerInfo suggestion) {
                addBuyerProvider.selectBuyerSuggestion(
                  context,
                  suggestion,
                );
              },
            );
          },
        ),
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        Selector<AddBuyerProvider, TextEditingController>(
          selector: (_, state) => state.buyerPhoneFieldController,
          builder: (context, controller, child) {
            return TextFieldWidget(
              label: localizationsContext.buyerMobile,
              controller: controller,
              maxLength: AppConfig.mobileNoFieldLength,
              keyBoardType: TextInputType.phone,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                PhoneNumberTextInputFormatter(),
              ],
              keepLabelAlwaysOnTop: true,
              onValueChanged: (int? currentIndex, String value) =>
                  addBuyerProvider.validateBuyerData(),
            );
          },
        ),
      ],
    );
  }
}
