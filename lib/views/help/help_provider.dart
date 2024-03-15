import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const/routes.dart';
import '../../const/string_const.dart';
import '../../localdb/isar_service.dart';
import '../../localdb/save_default_data.dart';
import '../../utils/app_config.dart';
import '../../widgets/snack_bar_view.dart';
import '../webview/model/webview_arguments.dart';

class HelpProvider extends ChangeNotifier {
  late AppLocalizations localization;
  List<String> helpOptionsList = [];
  List<String> bottomOptionIconList = [
    Strings.iconFaceBook,
    Strings.iconTwitter,
    Strings.iconInstagram,
    Strings.iconLinkdin,
  ];

  void initializeOptions(context) {
    localization = AppLocalizations.of(context)!;
    helpOptionsList = [
      localization.helpOptionAboutUs,
      localization.helpOptionFaq,
      localization.helpOptionPrivacyPolicy,
      localization.helpOptionTermsCondition,
    ];
    notifyListeners();
  }

  void onClick(context, String selected) async {
    final isarService = IsarService();
    if (selected == localization.helpOptionFaq) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.faqsLinkId,
      );
      _launchWebView(
        context,
        title: localization.titleFaq,
        url: url?.webLink ?? AppConfig.faqUrl,
      );
    } else if (selected == localization.helpOptionPrivacyPolicy) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.privacyLinkId,
      );
      _launchWebView(
        context,
        title: localization.privacyPolicy,
        url: url?.webLink ?? AppConfig.privacyPolicyUrl,
      );
    } else if (selected == localization.helpOptionTermsCondition) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.termsLinkId,
      );
      _launchWebView(
        context,
        title: localization.termsCondition,
        url: url?.webLink ?? AppConfig.termsAndConditionUrl,
      );
    } else if (selected == localization.helpOptionAboutUs) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.aboutUsLinkId,
      );
      _launchWebView(
        context,
        title: localization.aboutUs,
        url: url?.webLink ?? AppConfig.aboutUsUrl,
      );
    } else if (selected == Strings.iconFaceBook) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.facebookLinkId,
      );
      launchSocial(
        context,
        url: url?.webLink ?? AppConfig.facebookUrl,
      );
    } else if (selected == Strings.iconTwitter) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.twitterLinkId,
      );
      launchSocial(
        context,
        url: url?.webLink ?? AppConfig.twitterUrl,
      );
    } else if (selected == Strings.iconInstagram) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.instagramLinkId,
      );
      launchSocial(
        context,
        url: url?.webLink ?? AppConfig.instagramUrl,
      );
    } else if (selected == Strings.iconLinkdin) {
      final url = await isarService.getWebLinkById(
        SaveDefaultData.linkedInLinkId,
      );
      launchSocial(
        context,
        url: url?.webLink ?? AppConfig.linkedInUrl,
      );
    }
  }

  _launchWebView(
    BuildContext context, {
    required String title,
    required String url,
  }) {
    Navigator.pushNamed(
      context,
      Routes.webView,
      arguments: WebViewArgs(
        title: title,
        url: url,
      ),
    );
  }

  Future<void> launchSocial(
    BuildContext context, {
    required String url,
  }) async {
    Uri uri = Uri.parse(url);
    final _canLaunch = await canLaunchUrl(uri);
    if (kIsWeb) {
      if (_canLaunch) {
        await launchUrl(uri);
      } else {
        SnackBarView.showSnackBar(context, localization.failedToLaunchSocial);
      }
      return;
    }
    if (Platform.isAndroid) {
      if (url.startsWith('https://www.facebook.com/')) {
        final url2 = 'fb://facewebmodal/f?href=$url';
        final intent2 = AndroidIntent(action: 'action_view', data: url2);
        final canWork = await intent2.canResolveActivity();
        if (canWork != null && canWork) return intent2.launch();
      }
      final intent = AndroidIntent(action: 'action_view', data: url);
      return intent.launch();
    } else {
      if (_canLaunch) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        SnackBarView.showSnackBar(context, localization.failedToLaunchSocial);
      }
    }
  }
}
