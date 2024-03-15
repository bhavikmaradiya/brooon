import 'dart:io';

import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import './app_config.dart';
import './phone_number_input_formatter.dart';

class ContactModel {
  String name = '';
  String phoneNo = '';
  String email = '';
}

class ContactHelper {
  static String _formatPhoneNumber(String phone) {
    String phoneNo = phone;
    phoneNo = phoneNo.replaceAll(RegExp('[^0-9]'), '');
    final start = (phoneNo.length - AppConfig.mobileNoLength) < 0
        ? 0
        : (phoneNo.length - AppConfig.mobileNoLength);
    phoneNo = phoneNo.substring(start, phoneNo.length);
    return PhoneNumberTextInputFormatter.phoneFormatter(phoneNo).toString();
  }

  static Future<ContactModel?> chooseFromContacts() async {
    ContactModel model = ContactModel();
    if (Platform.isAndroid) {
      try {
        final FullContact contact = await FlutterContactPicker.pickFullContact(
          askForPermission: true,
        );
        if (contact.name?.firstName != null) {
          String name = '${contact.name!.firstName}';
          if (contact.name?.middleName != null) {
            name += ' ${contact.name!.middleName}';
          }
          if (contact.name?.lastName != null) {
            name += ' ${contact.name!.lastName}';
          }
          model.name = name;
        }
        if (contact.phones.isNotEmpty) {
          if (contact.phones[0].number != null) {
            model.phoneNo = _formatPhoneNumber(contact.phones[0].number!);
          }
        }
        if (contact.emails.isNotEmpty) {
          if (contact.emails[0].email != null) {
            String email = contact.emails[0].email!.trim();
            model.email = email;
          }
        }
      } on UserCancelledPickingException catch (_) {
        return null;
      } catch (_) {
        return null;
      }
    } else if (Platform.isIOS) {
      try {
        final PhoneContact contact =
            await FlutterContactPicker.pickPhoneContact();
        if (contact.fullName != null) {
          model.name = contact.fullName!;
        }
        if (contact.phoneNumber?.number != null) {
          model.phoneNo = _formatPhoneNumber(contact.phoneNumber!.number!);
        }
      } on UserCancelledPickingException catch (_) {
        return null;
      } catch (_) {
        return null;
      }
    }
    return model;
  }
}
