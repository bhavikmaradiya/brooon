import 'dart:collection';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../localdb/isar_service.dart';
import '../../../localdb/properties/db_property.dart';
import '../../../localdb/properties/db_saved_filter.dart';
import '../../../utils/static_functions.dart';
import '../api_request/matching_request.dart';
import '../model/buyer_seller_info.dart';

extension DoublePrecision on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class MatchingRequestUtils {
  static bool isInquiryHasMinRequiredDetails(DbSavedFilter inquiry) {
    return (inquiry.minMeasure != null && inquiry.minMeasure! > 0) ||
        (inquiry.maxMeasure != null && inquiry.maxMeasure! > 0) ||
        (inquiry.sellPriceRangeMin != null && inquiry.sellPriceRangeMin! > 0) ||
        (inquiry.rentPriceRangeMin != null && inquiry.rentPriceRangeMin! > 0) ||
        (inquiry.leasePriceRangeMin != null &&
            inquiry.leasePriceRangeMin! > 0) ||
        (inquiry.sellPriceRangeMax != null && inquiry.sellPriceRangeMax! > 0) ||
        (inquiry.rentPriceRangeMax != null && inquiry.rentPriceRangeMax! > 0) ||
        (inquiry.leasePriceRangeMax != null &&
            inquiry.leasePriceRangeMax! > 0) ||
        (inquiry.location != null && inquiry.location!.trim().isNotEmpty) ||
        (inquiry.area != null && inquiry.area!.trim().isNotEmpty) ||
        (inquiry.latitude != null && inquiry.latitude != 0) ||
        (inquiry.longitude != null && inquiry.longitude != 0);
  }

  static bool isPropertyHasMinRequiredDetails(DbProperty property) {
    return (property.propertyAreaSize != null &&
            property.propertyAreaSize! > 0) ||
        (property.minSellPrice != null && property.minSellPrice! > 0) ||
        (property.minRentPrice != null && property.minRentPrice! > 0) ||
        (property.minLeasePrice != null && property.minLeasePrice! > 0) ||
        (property.maxSellPrice != null && property.maxSellPrice! > 0) ||
        (property.maxRentPrice != null && property.maxRentPrice! > 0) ||
        (property.maxLeasePrice != null && property.maxLeasePrice! > 0) ||
        (property.publicAddressLandMark != null &&
            property.publicAddressLandMark!.trim().isNotEmpty) ||
        (property.publicArea != null &&
            property.publicArea!.trim().isNotEmpty) ||
        (property.publicLatitude != null && property.publicLatitude != 0) ||
        (property.publicLongitude != null && property.publicLongitude != 0);
  }

  static Future<List<dynamic>> requestToFindMatchingProperties(
    AppLocalizations localizationsContext,
    List<BuyerSellerInfo> filteredBuyerSellerInfoList,
  ) async {
    if (filteredBuyerSellerInfoList.isNotEmpty) {
      final _isarService = IsarService();
      final List<dynamic> matchingApiRequest = [];
      // Grouping Inquiries with Property type
      final HashMap<String, List<DbSavedFilter>> matchingPropertyMap =
          HashMap();
      filteredBuyerSellerInfoList.forEach(
        (element) {
          if (element.inquiries != null && element.inquiries!.isNotEmpty) {
            element.inquiries!.forEach(
              (inquiry) {
                // Ignoring Inquiries which don't have one of: size, price, location
                if (isInquiryHasMinRequiredDetails(inquiry)) {
                  if (inquiry.propertyTypeValues != null &&
                      inquiry.propertyTypeValues!.isNotEmpty) {
                    inquiry.propertyTypeValues!.forEach(
                      (propertyType) {
                        if (matchingPropertyMap.containsKey(propertyType)) {
                          final list = matchingPropertyMap[propertyType] ?? [];
                          list.add(inquiry);
                          matchingPropertyMap[propertyType] = list;
                        } else {
                          matchingPropertyMap[propertyType] = [inquiry];
                        }
                      },
                    );
                  }
                }
              },
            );
          }
        },
      );
      for (int k = 0; k < matchingPropertyMap.keys.length; k++) {
        final type = matchingPropertyMap.keys.toList()[k]; // key
        final value = matchingPropertyMap[type] ?? [];
        final Set<String> xFor = Set();
        double? minSellPrice;
        double? maxSellPrice;
        double? minRentPrice;
        double? maxRentPrice;
        double? minLeasePrice;
        double? maxLeasePrice;
        double? minSize;
        double? maxSize;
        String? sizeType;

        List<double> sellPriceRange = [];
        List<double> rentPriceRange = [];
        List<double> leasePriceRange = [];
        List<double> sizeRange = [];

        await Future.forEach(
          value,
          (inquiry) async {
            if (inquiry.propertyForValues != null &&
                inquiry.propertyForValues!.isNotEmpty) {
              inquiry.propertyForValues!.forEach(
                (inquiryFor) {
                  if (inquiryFor == localizationsContext.buy) {
                    xFor.add(localizationsContext.sell.toLowerCase());
                  } else {
                    xFor.add(inquiryFor.toLowerCase());
                  }
                },
              );
            }

            if (inquiry.sellPriceRangeMin != null) {
              sellPriceRange.add(inquiry.sellPriceRangeMin!);
            }
            if (inquiry.rentPriceRangeMin != null) {
              rentPriceRange.add(inquiry.rentPriceRangeMin!);
            }
            if (inquiry.leasePriceRangeMin != null) {
              leasePriceRange.add(inquiry.leasePriceRangeMin!);
            }
            if (inquiry.sellPriceRangeMax != null) {
              sellPriceRange.add(inquiry.sellPriceRangeMax!);
            }
            if (inquiry.rentPriceRangeMax != null) {
              rentPriceRange.add(inquiry.rentPriceRangeMax!);
            }
            if (inquiry.leasePriceRangeMax != null) {
              leasePriceRange.add(inquiry.leasePriceRangeMax!);
            }

            double? inquiryMinMeasure;
            double? inquiryMaxMeasure;

            // check for same unit as default?
            final defaultSizeUnitId = StaticFunctions.getDefaultAreaUnitId(
              inquiry.propertyType![0],
            );
            if (inquiry.measureUnit == defaultSizeUnitId) {
              inquiryMinMeasure = inquiry.minMeasure;
              inquiryMaxMeasure = inquiry.maxMeasure;
              sizeType = inquiry.measureUnitValue;
            } else {
              // if not as default then convert size value based on default unit
              final isMinSizeAdded =
                  inquiry.minMeasure != null && inquiry.minMeasure! > 0;
              final isMaxSizeAdded =
                  inquiry.maxMeasure != null && inquiry.maxMeasure! > 0;
              final isSizeUnit = inquiry.measureUnit != null;

              if (isSizeUnit && (isMinSizeAdded || isMaxSizeAdded)) {
                final unitValue = await _isarService.getUnitValueOf(
                  inquiry.measureUnit!,
                  defaultSizeUnitId,
                );
                if (isMinSizeAdded) {
                  inquiryMinMeasure =
                      (unitValue * inquiry.minMeasure!).toPrecision(2);
                }
                if (isMaxSizeAdded) {
                  inquiryMaxMeasure =
                      (unitValue * inquiry.maxMeasure!).toPrecision(2);
                }
              }

              final propertyAreaUnit =
                  await _isarService.getPropertyAreaUnitById(
                defaultSizeUnitId,
              );
              if (propertyAreaUnit != null) {
                sizeType = propertyAreaUnit.unit;
              }
            }

            if (inquiryMinMeasure != null) {
              sizeRange.add(inquiryMinMeasure);
            }

            if (inquiryMaxMeasure != null) {
              sizeRange.add(inquiryMaxMeasure);
            }
          },
        );

        // sort price ascending
        if (sellPriceRange.isNotEmpty) {
          sellPriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minSellPrice = sellPriceRange.first;
          maxSellPrice = sellPriceRange.last;
        }
        if (rentPriceRange.isNotEmpty) {
          rentPriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minRentPrice = rentPriceRange.first;
          maxRentPrice = rentPriceRange.last;
        }
        if (leasePriceRange.isNotEmpty) {
          leasePriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minLeasePrice = leasePriceRange.first;
          maxLeasePrice = leasePriceRange.last;
        }
        // sort size ascending
        if (sizeRange.isNotEmpty) {
          sizeRange.sort(
            (a, b) => a.compareTo(b),
          );
          minSize = sizeRange.first;
          maxSize = sizeRange.last;
        }

        final matchingRequest = MatchingRequest(
          type: type,
          xFor: xFor.toList(),
          minSellPrice: minSellPrice,
          minRentPrice: minRentPrice,
          minLeasePrice: minLeasePrice,
          maxSellPrice: maxSellPrice,
          maxRentPrice: maxRentPrice,
          maxLeasePrice: maxLeasePrice,
          minSize: minSize,
          maxSize: maxSize,
          sizeType: sizeType,
          findMatchingInquiries: false,
        );
        matchingApiRequest.add(matchingRequest);
      }
      return matchingApiRequest;
    }
    return [];
  }

  static Future<List<dynamic>> requestToFindMatchingInquiries(
    AppLocalizations localizationsContext,
    List<BuyerSellerInfo> filteredBuyerSellerInfoList,
  ) async {
    if (filteredBuyerSellerInfoList.isNotEmpty) {
      final _isarService = IsarService();
      final List<dynamic> matchingApiRequest = [];
      // Grouping Properties with Property type
      final HashMap<String, List<DbProperty>> matchingPropertyMap = HashMap();
      filteredBuyerSellerInfoList.forEach(
        (element) {
          if (element.properties != null && element.properties!.isNotEmpty) {
            element.properties!.forEach(
              (property) {
                // Ignoring Properties which don't have one of: size, price, location
                if (isPropertyHasMinRequiredDetails(property)) {
                  if (property.propertyTypeValue.isNotEmpty) {
                    final propertyType = property.propertyTypeValue;
                    if (matchingPropertyMap.containsKey(propertyType)) {
                      final list = matchingPropertyMap[propertyType] ?? [];
                      list.add(property);
                      matchingPropertyMap[propertyType] = list;
                    } else {
                      matchingPropertyMap[propertyType] = [property];
                    }
                  }
                }
              },
            );
          }
        },
      );
      for (int k = 0; k < matchingPropertyMap.keys.length; k++) {
        final type = matchingPropertyMap.keys.toList()[k]; // key
        final value = matchingPropertyMap[type] ?? [];
        final Set<String> xFor = Set();
        double? minSellPrice;
        double? maxSellPrice;
        double? minRentPrice;
        double? maxRentPrice;
        double? minLeasePrice;
        double? maxLeasePrice;
        double? minSize;
        double? maxSize;
        String? sizeType;
        List<double> sellPriceRange = [];
        List<double> rentPriceRange = [];
        List<double> leasePriceRange = [];
        List<double> sizeRange = [];

        await Future.forEach(
          value,
          (property) async {
            if (property.propertyForValues != null &&
                property.propertyForValues!.isNotEmpty) {
              property.propertyForValues!.forEach(
                (propertyFor) {
                  if (propertyFor == localizationsContext.sell) {
                    xFor.add(localizationsContext.buy.toLowerCase());
                  } else {
                    xFor.add(propertyFor.toLowerCase());
                  }
                },
              );
            }
            if (property.minSellPrice != null) {
              sellPriceRange.add(property.minSellPrice!);
            }
            if (property.minRentPrice != null) {
              rentPriceRange.add(property.minRentPrice!);
            }
            if (property.minLeasePrice != null) {
              leasePriceRange.add(property.minLeasePrice!);
            }
            if (property.maxSellPrice != null) {
              sellPriceRange.add(property.maxSellPrice!);
            }
            if (property.maxRentPrice != null) {
              rentPriceRange.add(property.maxRentPrice!);
            }
            if (property.maxLeasePrice != null) {
              leasePriceRange.add(property.maxLeasePrice!);
            }

            double? propertyMinMeasure;

            // check for same unit as default?
            final defaultSizeUnitId = StaticFunctions.getDefaultAreaUnitId(
              property.propertyTypeId,
            );
            if (property.propertyAreaUnitId == defaultSizeUnitId) {
              propertyMinMeasure = property.propertyAreaSize;
              sizeType = property.propertyAreaUnitValue;
            } else {
              // if not as default then convert size value based on default unit
              final isMinSizeAdded = property.propertyAreaSize != null &&
                  property.propertyAreaSize! > 0;

              final isSizeUnit = property.propertyAreaUnitValue != null;

              if (isSizeUnit && isMinSizeAdded) {
                final unitValue = await _isarService.getUnitValueOf(
                  property.propertyAreaUnitId!,
                  defaultSizeUnitId,
                );
                if (isMinSizeAdded) {
                  propertyMinMeasure =
                      (unitValue * property.propertyAreaSize!).toPrecision(2);
                }
              }

              final propertyAreaUnit =
                  await _isarService.getPropertyAreaUnitById(
                defaultSizeUnitId,
              );
              if (propertyAreaUnit != null) {
                sizeType = propertyAreaUnit.unit;
              }
            }

            if (propertyMinMeasure != null) {
              sizeRange.add(propertyMinMeasure);
            }
          },
        );

        // sort price ascending
        if (sellPriceRange.isNotEmpty) {
          sellPriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minSellPrice = sellPriceRange.first;
          maxSellPrice = sellPriceRange.last;
        }
        if (rentPriceRange.isNotEmpty) {
          rentPriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minRentPrice = rentPriceRange.first;
          maxRentPrice = rentPriceRange.last;
        }
        if (leasePriceRange.isNotEmpty) {
          leasePriceRange.sort(
            (a, b) => a.compareTo(b),
          );
          minLeasePrice = leasePriceRange.first;
          maxLeasePrice = leasePriceRange.last;
        }
        // sort size ascending
        if (sizeRange.isNotEmpty) {
          sizeRange.sort(
            (a, b) => a.compareTo(b),
          );
          minSize = sizeRange.first;
          maxSize = sizeRange.last;
        }

        final matchingRequest = MatchingRequest(
          type: type,
          xFor: xFor.toList(),
          minSellPrice: minSellPrice,
          minRentPrice: minRentPrice,
          minLeasePrice: minLeasePrice,
          maxSellPrice: maxSellPrice,
          maxRentPrice: maxRentPrice,
          maxLeasePrice: maxLeasePrice,
          minSize: minSize,
          maxSize: maxSize,
          sizeType: sizeType,
          findMatchingInquiries: true,
        );
        matchingApiRequest.add(matchingRequest);
      }
      return matchingApiRequest;
    }
    return [];
  }
}
