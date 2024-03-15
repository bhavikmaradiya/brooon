import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import './model/gender_item_model.dart';
import './profile_from_enum.dart';
import '../../const/dimen_const.dart';
import '../../const/string_const.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../utils/theme_config.dart';
import '../../views/profile/profile_provider.dart';
import '../../widgets/bottom_sheet_grid_item.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/dropdown/drop_down_as_field.dart';
import '../../widgets/dropdown/drop_down_list.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/toolbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileFrom =
        ModalRoute.of(context)!.settings.arguments as ProfileFrom;
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: _ProfileBody(
        profileFrom: profileFrom,
      ),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  final ProfileFrom profileFrom;

  _ProfileBody({
    Key? key,
    required this.profileFrom,
  }) : super(key: key);

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody> {
  late AppLocalizations localizationsContext;
  late ProfileProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        provider = Provider.of<ProfileProvider>(context, listen: false);
        provider.init(
          localizationsContext,
          widget.profileFrom,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizationsContext = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: WillPopScope(
        onWillPop: () => Future.value(widget.profileFrom == ProfileFrom.drawer),
        child: SafeArea(
          child: Column(
            children: [
              Selector<ProfileProvider, DbUserInfo>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.userProfile,
                builder: (context, userInfo, child) {
                  return ToolBar(
                    title: widget.profileFrom == ProfileFrom.drawer
                        ? localizationsContext.profile
                        : localizationsContext.completeProfile,
                    enableBackground: true,
                    enableBack: widget.profileFrom == ProfileFrom.drawer,
                    centerTitle: !(widget.profileFrom == ProfileFrom.drawer),
                  );
                },
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenHorizontalMargin.w,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: (Dimensions.profileScreenProfileIconSize +
                                  Dimensions.profileScreenEditProfileIconSize)
                              .w,
                          margin: EdgeInsets.symmetric(
                            vertical: Dimensions
                                .profileScreenProfileIconVerticalMargin.h,
                          ),
                          child: Stack(
                            children: [
                              Selector<ProfileProvider, String?>(
                                shouldRebuild: (prev, next) => true,
                                selector: (_, state) =>
                                    state.userProfile.profilePic,
                                builder: (context, file, child) {
                                  return InkWell(
                                    onTap: () {
                                      _showProfileImagePicker(context);
                                    },
                                    splashColor: StaticFunctions.getColor(
                                      context,
                                      ColorEnum.touchSplashColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimensions
                                          .profileScreenProfileIconRadius.r,
                                    ),
                                    child: Container(
                                      height: Dimensions
                                          .profileScreenProfileIconSize.w,
                                      width: Dimensions
                                          .profileScreenProfileIconSize.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions
                                              .profileScreenProfileIconRadius.r,
                                        ),
                                        border: Border.all(
                                          width: Dimensions
                                              .profileScreenProfileIconBorderWidth
                                              .w,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.borderColorE0,
                                          ),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Dimensions
                                                .profileScreenProfileIconRadius
                                                .r,
                                          ),
                                        ), //
                                        child: ImageLoader(
                                          image: file ?? "",
                                          isUserPlaceHolder: true,
                                          isCurrentUserProfilePic: true,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                bottom: (Dimensions
                                            .profileScreenEditProfileIconSize /
                                        2)
                                    .w,
                                left: 0,
                                right: 0,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: Dimensions
                                          .profileScreenEditProfileIconSize.w,
                                      width: Dimensions
                                          .profileScreenEditProfileIconSize.w,
                                      decoration: BoxDecoration(
                                        color: StaticFunctions.getColor(
                                          context,
                                          ColorEnum.themeColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          Dimensions
                                              .profileScreenEditProfileIconRadius
                                              .r,
                                        ),
                                        border: Border.all(
                                          width: Dimensions
                                              .profileScreenEditProfileIconBorderWidth
                                              .w,
                                          color: StaticFunctions.getColor(
                                            context,
                                            ColorEnum.whiteColor,
                                          ),
                                        ),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            _showProfileImagePicker(context);
                                          },
                                          borderRadius: BorderRadius.circular(
                                            Dimensions
                                                .profileScreenEditProfileIconRadius
                                                .r,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(
                                              Dimensions
                                                  .profileScreenEditProfileIconInnerSpacing
                                                  .h,
                                            ),
                                            child: SvgPicture.asset(
                                              Strings.iconTakeImageFromCamera,
                                              color: StaticFunctions.getColor(
                                                context,
                                                ColorEnum.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Selector<ProfileProvider, TextEditingController>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => state.brokerIdFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: localizationsContext.brokerId,
                              controller: controller,
                              isEnabled: false,
                              keepLabelAlwaysOnTop: true,
                              onValueChanged:
                                  (int? currentIndex, String value) => {},
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Selector<ProfileProvider, TextEditingController>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) =>
                              state.firstNameFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: localizationsContext.firstName,
                              hint: localizationsContext.firstNameHint,
                              fontWeight: FontWeight.w400,
                              controller: controller,
                              keyBoardType: TextInputType.visiblePassword,
                              keepLabelAlwaysOnTop: true,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider.validateData(),
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Selector<ProfileProvider, TextEditingController>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => state.lastNameFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: localizationsContext.lastName,
                              hint: localizationsContext.lastNameHint,
                              fontWeight: FontWeight.w400,
                              controller: controller,
                              keyBoardType: TextInputType.visiblePassword,
                              keepLabelAlwaysOnTop: true,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider.validateData(),
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Selector<ProfileProvider, TextEditingController>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => state.phoneNumFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: localizationsContext.phone,
                              hint: localizationsContext.enterPhone,
                              fontWeight: FontWeight.w400,
                              controller: controller,
                              isEnabled: false,
                              keyBoardType: TextInputType.number,
                              keepLabelAlwaysOnTop: true,
                              onValueChanged:
                                  (int? currentIndex, String value) => {},
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Selector<ProfileProvider, TextEditingController>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => state.emailFieldController,
                          builder: (context, controller, child) {
                            return TextFieldWidget(
                              label: localizationsContext.email,
                              hint: localizationsContext.emailHint,
                              fontWeight: FontWeight.w400,
                              controller: controller,
                              keepLabelAlwaysOnTop: true,
                              keyBoardType: TextInputType.emailAddress,
                              onValueChanged:
                                  (int? currentIndex, String value) => {},
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Selector<ProfileProvider,
                                    TextEditingController>(
                                  shouldRebuild: (prev, next) => true,
                                  selector: (_, state) =>
                                      state.genderFieldController,
                                  builder: (context, controller, child) {
                                    return DropDownAsField(
                                      label: localizationsContext.gender,
                                      controller: controller,
                                      hint: localizationsContext.selectGender,
                                    );
                                  },
                                ),
                              ),
                              Selector<ProfileProvider, List<GenderItem>>(
                                shouldRebuild: (prev, next) => true,
                                selector: (_, state) => state.genderOptions,
                                builder: (context, list, child) {
                                  GenderItem? genderItem = list.isNotEmpty
                                      ? list.firstWhereOrNull(
                                          (element) => element.isSelected)
                                      : null;
                                  int selected =
                                      genderItem != null ? genderItem.id : -1;
                                  final List<int> ids = [];
                                  final List<String> values = [];
                                  for (int i = 0; i < list.length; i++) {
                                    ids.add(list[i].id);
                                    values.add(list[i].value);
                                  }
                                  return DropDownList(
                                    ids: ids,
                                    values: values,
                                    selectedId: selected,
                                    onDropDownSelectionChanged: (id, value) =>
                                        provider.selectGender(id),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                        Selector<ProfileProvider,
                            Tuple2<TextEditingController, bool>>(
                          shouldRebuild: (prev, next) => true,
                          selector: (_, state) => Tuple2(
                            state.associationIdFieldController,
                            state.isAssociationIdEnabled,
                          ),
                          builder: (context, tuple, child) {
                            return TextFieldWidget(
                              label: localizationsContext.associationId,
                              fontWeight: FontWeight.w400,
                              controller: tuple.item1,
                              keyBoardType: TextInputType.visiblePassword,
                              keepLabelAlwaysOnTop: true,
                              isEnabled: tuple.item2,
                              onValueChanged:
                                  (int? currentIndex, String value) =>
                                      provider.validateData(),
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              Dimensions.profileScreenFieldsBetweenSpacing.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.screenHorizontalMargin.w,
                    vertical: Dimensions.screenVerticalMarginBottom.h),
                child: Selector<ProfileProvider, DbUserInfo>(
                  shouldRebuild: (prev, next) => true,
                  selector: (_, state) => state.userProfile,
                  builder: (context, userInfo, child) {
                    return Row(
                      children: [
                        if (widget.profileFrom == ProfileFrom.drawer)
                          Expanded(
                            child: ButtonWidget(
                              text: localizationsContext.cancel,
                              onClick: () {
                                Navigator.pop(context);
                              },
                              fontWeight: FontWeight.w700,
                              borderRadius:
                                  Dimensions.profileScreenButtonsRadius.r,
                              borderColor: StaticFunctions.getColor(
                                context,
                                ColorEnum.borderColorE0,
                              ),
                              bgColor: StaticFunctions.getColor(
                                context,
                                ColorEnum.themeColorOpacity3Percentage,
                              ),
                              textColor: StaticFunctions.getColor(
                                context,
                                ColorEnum.themeColor,
                              ),
                            ),
                          ),
                        if (widget.profileFrom == ProfileFrom.drawer)
                          SizedBox(
                            width:
                                Dimensions.profileScreenButtonsBetweenSpacing.w,
                          ),
                        Expanded(
                          child: Selector<ProfileProvider, bool>(
                            shouldRebuild: (prev, next) => true,
                            selector: (_, state) => state.isValid,
                            builder: (context, isValid, child) {
                              return ButtonWidget(
                                text: localizationsContext.save,
                                borderRadius:
                                    Dimensions.profileScreenButtonsRadius.r,
                                onClick: () {
                                  provider.saveData(context);
                                },
                                fontWeight: FontWeight.w700,
                                textColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.whiteColor
                                      : ColorEnum.gray90Color,
                                ),
                                borderColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.themeColor
                                      : ColorEnum.borderColorE0,
                                ),
                                bgColor: StaticFunctions.getColor(
                                  context,
                                  isValid
                                      ? ColorEnum.themeColor
                                      : ColorEnum.themeColorOpacity3Percentage,
                                ),
                              );
                            },
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
      ),
    );
  }

  _showProfileImagePicker(BuildContext context) {
    String? profileImage = provider.userProfile.profilePic;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (dialogContext) {
        return Padding(
          padding: MediaQuery.of(dialogContext).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColoredBox(
                color: StaticFunctions.getColor(
                  dialogContext,
                  ColorEnum.themeColorOpacity6Percentage,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.screenHorizontalMargin.w,
                    right: (Dimensions.screenHorizontalMargin / 2).w,
                    top: Dimensions.bottomSheetTitleVerticalPadding.h,
                    bottom: Dimensions.bottomSheetTitleVerticalPadding.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizationsContext.profileImageDialogTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.bottomSheetTitleTextSize.sp,
                          color: StaticFunctions.getColor(
                            dialogContext,
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
                              Navigator.pop(dialogContext);
                            },
                            borderRadius: BorderRadius.circular(
                              Dimensions.closeIconRippleRadius.r,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions.closeIconPadding.w,
                              ),
                              child: SvgPicture.asset(
                                Strings.iconBottomSheetClose,
                                width: Dimensions.closeIconSize.w,
                                height: Dimensions.closeIconSize.w,
                                color: StaticFunctions.getColor(
                                  context,
                                  ColorEnum.gray99Color,
                                ),
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
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing:
                        Dimensions.bottomSheetGridBoxItemHorizontalSpacing.h,
                    mainAxisSpacing:
                        Dimensions.bottomSheetGridBoxItemVerticalSpacing.h,
                    childAspectRatio:
                        (Dimensions.profileBottomSheetGridBoxItemAspectRatioWidth /
                            Dimensions.profileBottomSheetGridBoxItemAspectRatioHeight),
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    BottomSheetGridItem(
                      title: localizationsContext.camera,
                      icon: Strings.iconTakeImageFromCamera,
                      onTap: () {
                        provider.chooseFromCamera();
                        Navigator.pop(context);
                      },
                    ),
                    BottomSheetGridItem(
                      title: localizationsContext.gallery,
                      icon: Strings.iconTakeImageFromGallery,
                      onTap: () {
                        provider.chooseFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    BottomSheetGridItem(
                      title: localizationsContext.deleteProfileImage,
                      icon: Strings.iconDelete,
                      isDisabled:
                          profileImage == null || profileImage.trim().isEmpty,
                      onTap: () {
                        provider.removeProfilePicture();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isDismissible: true,
      backgroundColor: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      barrierColor: StaticFunctions.getColor(
        context,
        ColorEnum.bottomSheetBarrierColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}
