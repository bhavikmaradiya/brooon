import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import './home_provider.dart';
import './model/drawer_model.dart';
import '../../const/dimen_const.dart';
import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/user_info/db_user_info.dart';
import '../../utils/enums.dart';
import '../../utils/static_functions.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/light_divider.dart';
import '../profile/profile_from_enum.dart';

class HomeDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final HomeProvider homeScreenProvider;
  final AppLocalizations localizationsContext;

  const HomeDrawer({
    Key? key,
    required this.scaffoldKey,
    required this.homeScreenProvider,
    required this.localizationsContext,
  }) : super(key: key);

  Widget _profileInfo(BuildContext context, DbUserInfo? userInfo) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            SizedBox(
              width: Dimensions.homeDrawerProfileIconSize.w,
              height: Dimensions.homeDrawerProfileIconSize.w,
              child: Padding(
                padding: EdgeInsets.all(
                  Dimensions.homeDrawerProfileIconPaddingSize.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.homeDrawerProfileIconRadius.r,
                    ),
                    border: Border.all(
                      width: Dimensions.imageOutlineBorderWidth.w,
                      color: StaticFunctions.getColor(
                        context,
                        ColorEnum.borderColorE0,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Dimensions.homeDrawerProfileIconRadius.r,
                      ),
                    ), //
                    child: ImageLoader(
                      image: userInfo?.profilePic ?? '',
                      isUserPlaceHolder: true,
                      isCurrentUserProfilePic: true,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Selector<HomeProvider, DbUserInfo?>(
                selector: (_, state) => state.userInfo,
                shouldRebuild: (prev, next) => true,
                builder: (context, userInfo, child) {
                  if (userInfo != null && userInfo.isVerifiedUser) {
                    return SvgPicture.asset(
                      Strings.iconVerifiedUser,
                      width: Dimensions.verifiedUserIconSize.w,
                      height: Dimensions.verifiedUserIconSize.w,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          width: Dimensions.homeDrawerUserContentSpacingBetween.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userInfo?.firstName ?? ''} ${userInfo?.lastName ?? ''}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.themeColor,
                  ),
                  fontSize: Dimensions.homeDrawerNameTextSize.sp,
                ),
              ),
              Text(
                userInfo?.email ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: StaticFunctions.getColor(
                    context,
                    ColorEnum.blackColor,
                  ),
                  fontSize: Dimensions.homeDrawerEmailTextSize.sp,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          Strings.iconRightArrow,
          color: StaticFunctions.getColor(
            context,
            ColorEnum.gray90Color,
          ),
        ),
      ],
    );
  }

  Widget _drawerSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.screenHorizontalMargin.w,
      ),
      child: LightDivider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StaticFunctions.getColor(
        context,
        ColorEnum.whiteColor,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.profile,
                  arguments: ProfileFrom.drawer,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: (Dimensions.screenHorizontalMargin / 2).w,
                    right: Dimensions.screenHorizontalMargin.w,
                    top: Dimensions.screenHorizontalMargin.h,
                    bottom: Dimensions.screenHorizontalMargin.h,
                  ),
                  child: Selector<HomeProvider, DbUserInfo?>(
                    shouldRebuild: (prev, next) => true,
                    selector: (_, state) => state.userInfo,
                    builder: (context, userInfo, child) {
                      return _profileInfo(context, userInfo);
                    },
                  ),
                ),
              ),
            ),
            _drawerSeparator(),
            Expanded(
              child: Selector<HomeProvider, List<DrawerItem>>(
                shouldRebuild: (prev, next) => true,
                selector: (_, state) => state.drawerList,
                builder: (context, drawerList, child) {
                  return ListView.builder(
                    itemCount: drawerList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          if (drawerList[index].title ==
                                  localizationsContext.drawerItemReminder ||
                              drawerList[index].title ==
                                  localizationsContext.drawerItemLogout)
                            _drawerSeparator(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                scaffoldKey.currentState?.closeDrawer();
                                homeScreenProvider.onDrawerItemSelected(
                                  context,
                                  drawerList[index],
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Dimensions.screenHorizontalMargin.w,
                                  vertical: Dimensions
                                      .homeDrawerItemVerticalSpacing.h,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      drawerList[index].icon,
                                      height:
                                          Dimensions.homeDrawerItemIconSize.h,
                                      width:
                                          Dimensions.homeDrawerItemIconSize.h,
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .homeDrawerItemSpacingBetween.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        drawerList[index].title,
                                        style: TextStyle(
                                          fontSize: Dimensions
                                              .homeDrawerItemTextSize.sp,
                                          color: StaticFunctions.getColor(
                                            context,
                                            drawerList[index].title ==
                                                    localizationsContext
                                                        .drawerItemLogout
                                                ? ColorEnum.redColor
                                                : ColorEnum.blackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
