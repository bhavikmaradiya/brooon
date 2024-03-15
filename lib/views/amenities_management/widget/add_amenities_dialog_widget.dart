import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_amenity.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../amenities_management_provider.dart';

class AddAmenitiesWidget extends StatefulWidget {
  const AddAmenitiesWidget({
    Key? key,
    required this.localizationsContext,
    required this.addAmenityController,
    required this.provider,
    required this.amenityToEdit,
  }) : super(key: key);

  final AppLocalizations localizationsContext;
  final TextEditingController addAmenityController;
  final AmenitiesManagementProvider? provider;
  final DbPropertyAmenity? amenityToEdit;

  @override
  State<AddAmenitiesWidget> createState() => _AddAmenitiesWidgetState();
}

class _AddAmenitiesWidgetState extends State<AddAmenitiesWidget> {
  bool isNameAlreadyTaken = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: StaticFunctions.getColor(
              context,
              ColorEnum.themeColorOpacity3Percentage,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.screenHorizontalMargin.w,
                right: (Dimensions.screenHorizontalMargin / 2).w,
                top: Dimensions.screenHorizontalMargin.h,
                bottom: Dimensions.screenHorizontalMargin.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.amenityToEdit == null
                        ? widget.localizationsContext.titleAddAmenity
                        : widget.localizationsContext.titleEditAmenity,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.blackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: Dimensions.closeIconSize.w,
                    height: Dimensions.closeIconSize.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.closeIconRippleRadius.r,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(
                          Dimensions.closeIconRippleRadius.r,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            Dimensions.closeIconPadding.w,
                          ),
                          child: SvgPicture.asset(
                            Strings.iconClose,
                            width: Dimensions.closeIconSize.w,
                            height: Dimensions.closeIconSize.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalMargin.w,
              vertical: Dimensions.screenVerticalMarginBottom.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  label: widget.localizationsContext.labelAmenityName,
                  hint: widget.localizationsContext.hintAmenityName,
                  keepLabelAlwaysOnTop: true,
                  autoFocus: true,
                  controller: widget.addAmenityController,
                  keyBoardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  onValueChanged: (int? currentIndex, String value) {},
                ),
                AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  child: isNameAlreadyTaken
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:
                                  Dimensions.amenityFieldErrorTextMarginTop.h,
                            ),
                            Text(
                              widget
                                  .localizationsContext.amenityNameAlreadyTaken,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.errorColor,
                                ),
                                fontSize:
                                    Dimensions.amenityFieldErrorTextSize.sp,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
                SizedBox(
                  height: Dimensions.amenityScreenDialogContentSpaceBetween.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ButtonWidget(
                        text: widget.localizationsContext.btnCancelAmenity,
                        onClick: () {
                          Navigator.pop(context);
                        },
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                        borderWidth:
                            Dimensions.amenityScreenDialogButtonBorderWidth.w,
                        textColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColorOpacity3Percentage,
                        ),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.amenityScreenDialogButtonSpaceBetween.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: ButtonWidget(
                        text: widget.amenityToEdit == null
                            ? widget.localizationsContext.btnAddAmenity
                            : widget.localizationsContext.btnEditAmenity,
                        onClick: () {
                          var amenity = widget.provider!.amenityList.where(
                              (element) =>
                                  element.name.toLowerCase() ==
                                  widget.addAmenityController.text
                                      .toLowerCase());
                          bool isValidToStore = widget.addAmenityController.text
                                  .trim()
                                  .isNotEmpty &&
                              (amenity.isEmpty ||
                                  widget.amenityToEdit != null &&
                                      amenity.first.id ==
                                          widget.amenityToEdit!.id);
                          if (isValidToStore) {
                            setState(() {
                              isNameAlreadyTaken = false;
                            });
                            DbPropertyAmenity amenityToSave =
                                DbPropertyAmenity();
                            if (widget.amenityToEdit != null) {
                              amenityToSave.id = widget.amenityToEdit!.id;
                              amenityToSave.assetPath =
                                  widget.amenityToEdit!.assetPath;
                              amenityToSave.isSelected =
                                  widget.amenityToEdit!.isSelected;
                            }
                            amenityToSave.name = widget
                                .addAmenityController.text
                                .toCapitalized();
                            widget.provider!.saveAmenity(amenityToSave);
                            if (widget.amenityToEdit != null) {
                              Navigator.pop(context);
                            } else {
                              widget.addAmenityController.text = "";
                            }
                          } else if (widget.addAmenityController.text
                              .trim()
                              .isNotEmpty) {
                            setState(() {
                              isNameAlreadyTaken = true;
                            });
                          }
                        },
                        textColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.whiteColor,
                        ),
                        bgColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.themeColor,
                        ),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
