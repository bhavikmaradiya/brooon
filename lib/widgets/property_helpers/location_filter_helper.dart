import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../localdb/properties/db_property.dart';
import '../../localdb/properties/db_saved_filter.dart';
import '../../utils/app_config.dart';
import '../../utils/static_functions.dart';

class LocationFilterHelper {
  static List<DbProperty> applyLocationFilterForPropertiesIfRequired({
    required String? typedLocation,
    required double? latitude,
    required double? longitude,
    required List<DbProperty> filteredList,
  }) {
    final List<DbProperty> matchedLocationList = [];
    final List<DbProperty> unMatchedLocationList = [];
    bool isTypedLocationAvailable = false;
    bool isMapLocationAvailable = false;
    if (typedLocation != null && typedLocation.trim().isNotEmpty) {
      isTypedLocationAvailable = true;
      final list = typedLocation.trim().split(',');
      if (list.isNotEmpty) {
        filteredList.forEach(
          (filter) {
            bool isAddressAvailable = false;
            if (filter.addressLandMark != null) {
              isAddressAvailable = list.any(
                (locationTags) => filter.addressLandMark!
                    .trim()
                    .toLowerCase()
                    .contains(locationTags.trim().toLowerCase()),
              );
            } else if (filter.area != null) {
              isAddressAvailable = list.any(
                (locationTags) => filter.area!
                    .trim()
                    .toLowerCase()
                    .contains(locationTags.trim().toLowerCase()),
              );
            }
            if (isAddressAvailable) {
              matchedLocationList.add(filter);
            } else {
              unMatchedLocationList.add(filter);
            }
          },
        );
      } else {
        unMatchedLocationList.addAll(filteredList);
      }
    } else {
      unMatchedLocationList.addAll(filteredList);
    }
    if (latitude != null &&
        longitude != null &&
        latitude != 0 &&
        longitude != 0) {
      isMapLocationAvailable = true;
      unMatchedLocationList.forEach(
        (propertyInfo) {
          if (propertyInfo.latitude != null &&
              propertyInfo.longitude != null &&
              propertyInfo.latitude != 0 &&
              propertyInfo.longitude != 0) {
            final distanceInMeter = Geolocator.distanceBetween(
              propertyInfo.latitude!,
              propertyInfo.longitude!,
              latitude,
              longitude,
            );
            debugPrint(
              'View Properties : DistanceInM for ${propertyInfo.propertyId}: $distanceInMeter',
            );
            if (distanceInMeter <=
                StaticFunctions.userInfo!.privateSearchDistance *
                    AppConfig.distanceMToKm) {
              propertyInfo.distance = distanceInMeter;
              matchedLocationList.add(propertyInfo);
            }
          }
        },
      );
    }
    if (!isTypedLocationAvailable && !isMapLocationAvailable) {
      // No location details are available in filter object so show all properties
      return filteredList;
    }
    // Else show matched location list
    return matchedLocationList;
  }

  static List<DbSavedFilter> applyLocationFilterForInquiresIfRequired({
    required String? typedLocation,
    required double? latitude,
    required double? longitude,
    required List<DbSavedFilter> filteredList,
  }) {
    final List<DbSavedFilter> matchedLocationList = [];
    final List<DbSavedFilter> unMatchedLocationList = [];
    bool isTypedLocationAvailable = false;
    bool isMapLocationAvailable = false;
    if (typedLocation != null && typedLocation.trim().isNotEmpty) {
      isTypedLocationAvailable = true;
      final list = typedLocation.trim().split(',');
      if (list.isNotEmpty) {
        filteredList.forEach(
          (filter) {
            bool isAddressAvailable = false;
            if (filter.location != null) {
              isAddressAvailable = list.any(
                (locationTags) => filter.location!
                    .trim()
                    .toLowerCase()
                    .contains(locationTags.trim().toLowerCase()),
              );
            } else if (filter.area != null) {
              isAddressAvailable = list.any(
                (locationTags) => filter.area!
                    .trim()
                    .toLowerCase()
                    .contains(locationTags.trim().toLowerCase()),
              );
            }
            if (isAddressAvailable) {
              matchedLocationList.add(filter);
            } else {
              unMatchedLocationList.add(filter);
            }
          },
        );
      } else {
        unMatchedLocationList.addAll(filteredList);
      }
    } else {
      unMatchedLocationList.addAll(filteredList);
    }
    if (latitude != null &&
        longitude != null &&
        latitude != 0 &&
        longitude != 0) {
      isMapLocationAvailable = true;
      unMatchedLocationList.forEach(
        (inquiryInfo) {
          if (inquiryInfo.latitude != null &&
              inquiryInfo.longitude != null &&
              inquiryInfo.latitude != 0 &&
              inquiryInfo.longitude != 0) {
            final distanceInMeter = Geolocator.distanceBetween(
              inquiryInfo.latitude!,
              inquiryInfo.longitude!,
              latitude,
              longitude,
            );
            debugPrint(
              'View Inquiries : DistanceInM for ${inquiryInfo.inquiryId}: $distanceInMeter',
            );
            if (distanceInMeter <=
                StaticFunctions.userInfo!.privateSearchDistance *
                    AppConfig.distanceMToKm) {
              inquiryInfo.distance = distanceInMeter;
              matchedLocationList.add(inquiryInfo);
            }
          }
        },
      );
    }
    if (!isTypedLocationAvailable && !isMapLocationAvailable) {
      // No location details are available in filter object so show all properties
      return filteredList;
    }
    // Else show matched location list
    return matchedLocationList;
  }
}
