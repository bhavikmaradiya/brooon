import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../const/dimen_const.dart';
import '../../../const/string_const.dart';
import '../../../localdb/properties/db_property_preferred_cast.dart';
import '../../../utils/enums.dart';
import '../../../utils/static_functions.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../cast_management_provider.dart';

class AddCastWidget extends StatefulWidget {
  const AddCastWidget({
    Key? key,
    required this.localizationsContext,
    required this.addCastController,
    required this.provider,
    required this.castToEdit,
  }) : super(key: key);

  final AppLocalizations localizationsContext;
  final TextEditingController addCastController;
  final CastManagementProvider? provider;
  final DbPropertyPreferredCast? castToEdit;

  @override
  State<AddCastWidget> createState() => _AddCastWidgetState();
}

class _AddCastWidgetState extends State<AddCastWidget> {
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
                    widget.castToEdit == null
                        ? widget.localizationsContext.titleAddCast
                        : widget.localizationsContext.titleEditCast,
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
                  label: widget.localizationsContext.labelCastName,
                  hint: widget.localizationsContext.hintCastName,
                  keepLabelAlwaysOnTop: true,
                  autoFocus: true,
                  controller: widget.addCastController,
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
                              height: Dimensions.castFieldErrorTextMarginTop.h,
                            ),
                            Text(
                              widget.localizationsContext.castNameAlreadyTaken,
                              style: TextStyle(
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.errorColor,
                                ),
                                fontSize: Dimensions.castFieldErrorTextSize.sp,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
                SizedBox(
                  height: Dimensions.castScreenDialogContentSpaceBetween.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ButtonWidget(
                        text: widget.localizationsContext.btnCancelCast,
                        onClick: () {
                          Navigator.pop(context);
                        },
                        borderColor: StaticFunctions.getColor(
                          context,
                          ColorEnum.borderColorE0,
                        ),
                        borderWidth:
                            Dimensions.castScreenDialogButtonBorderWidth.w,
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
                      width: Dimensions.castScreenDialogButtonSpaceBetween.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: ButtonWidget(
                        text: widget.castToEdit == null
                            ? widget.localizationsContext.btnAddCast
                            : widget.localizationsContext.btnEditCast,
                        onClick: () {
                          var cast = widget.provider!.castList.where(
                              (element) =>
                                  element.name.toLowerCase() ==
                                  widget.addCastController.text.toLowerCase());
                          bool isValidToStore = widget.addCastController.text
                                  .trim()
                                  .isNotEmpty &&
                              (cast.isEmpty ||
                                  widget.castToEdit != null &&
                                      cast.first.id == widget.castToEdit!.id);
                          if (isValidToStore) {
                            setState(() {
                              isNameAlreadyTaken = false;
                            });
                            DbPropertyPreferredCast castToSave =
                                DbPropertyPreferredCast();
                            if (widget.castToEdit != null) {
                              castToSave.id = widget.castToEdit!.id;
                              castToSave.isSelected =
                                  widget.castToEdit!.isSelected;
                            }
                            castToSave.name =
                                widget.addCastController.text.toCapitalized();
                            widget.provider!.saveCast(castToSave);
                            if (widget.castToEdit != null) {
                              Navigator.pop(context);
                            } else {
                              widget.addCastController.text = "";
                            }
                          } else if (widget.addCastController.text
                              .trim()
                              .isNotEmpty) {
                            setState(() {
                              isNameAlreadyTaken = true;
                            });
                          }
                        },
                        textColor: StaticFunctions.getColor(
                            context, ColorEnum.whiteColor),
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
