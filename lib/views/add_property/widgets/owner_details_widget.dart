import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import '../add_property_provider.dart';

class PropertyOwnerDetails extends StatelessWidget {
  final AddPropertyProvider provider;
  final AppLocalizations localizationsContext;

  const PropertyOwnerDetails({
    Key? key,
    required this.provider,
    required this.localizationsContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithDropdown(
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
            controller: provider.ownerNameController,
            label: '${localizationsContext.sellerName}*',
            suffixIconPath: Strings.iconPhoneBook,
            onSuffixIconClick: () => provider.openContactsToPickPhone(),
            onChanged: (value) {
              provider.updatePropertyDetails(
                localizationsContext.sellerName,
                value,
              );
            },
          ),
          suggestionsCallback: (pattern) {
            return provider.getFilteredSeller(pattern);
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
            provider.selectSellerSuggestion(
              context,
              suggestion,
            );
          },
        ),
        SizedBox(
          height: Dimensions.addBuyerBasicDetailFieldsPadding.h,
        ),
        TextFieldWidget(
          label: localizationsContext.sellerMobile,
          keyBoardType: TextInputType.phone,
          maxLength: AppConfig.mobileNoFieldLength,
          keepLabelAlwaysOnTop: true,
          inputAction: TextInputAction.done,
          controller: provider.sellerPhoneController,
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            PhoneNumberTextInputFormatter(),
          ],
          onValueChanged: (int? currentIndex, String value) {
            return provider.updatePropertyDetails(
              localizationsContext.sellerMobile,
              value,
            );
          },
        ),
      ],
    );
  }
}
