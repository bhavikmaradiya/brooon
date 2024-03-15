import 'dart:collection';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './isar_service.dart';
import './properties/db_property.dart';
import './properties/db_saved_filter.dart';
import './save_default_data.dart';
import '../common_property_data_provider.dart';
import '../network/dio_client.dart';
import '../utils/static_functions.dart';
import '../views/buyers_sellers/model/buyer_seller_info.dart';
import '../views/buyers_sellers/utils/matching_request_utils.dart';
import '../views/shared_by_brooon/api_response/brooon_matching_inquiry_response_entity.dart';
import '../views/shared_by_brooon/api_response/shared_by_brooon_matching_response_entity.dart';
import '../widgets/property_helpers/location_filter_helper.dart';

extension Range on double {
  bool isBetweenOrEqual(double from, double to) {
    return from <= this && this <= to;
  }
}

class MatchingQuery {
  static Future<List<BuyerSellerInfo>?> getMatchingBrooonInquiries(
    AppLocalizations localizationsContext,
    List<BuyerSellerInfo> filteredBuyerSellerInfoList,
  ) async {
    // generate json for Brooon matching inquiries
    final request = await MatchingRequestUtils.requestToFindMatchingInquiries(
      localizationsContext,
      filteredBuyerSellerInfoList,
    );
    if (request.isNotEmpty) {
      final response = await DioClient().filterSharedByBrooonsMatchingInquiry(
        request,
      );
      if (response != null) {
        filteredBuyerSellerInfoList = await _arrangeBrooonMatchingInquiries(
          response: response,
          filteredBuyerSellerInfoList: filteredBuyerSellerInfoList,
          localizationsContext: localizationsContext,
        );
        return filteredBuyerSellerInfoList;
      }
    }
    return null;
  }

  static Future<List<BuyerSellerInfo>?> getMatchingBrooonProperties(
    AppLocalizations localizationsContext,
    List<BuyerSellerInfo> filteredBuyerSellerInfoList,
  ) async {
    // generate json for Brooon matching properties
    final request = await MatchingRequestUtils.requestToFindMatchingProperties(
      localizationsContext,
      filteredBuyerSellerInfoList,
    );
    if (request.isNotEmpty) {
      final response = await DioClient().filterSharedByBrooonsMatchingProperty(
        request,
      );
      if (response != null) {
        filteredBuyerSellerInfoList = await _arrangeBrooonMatchingProperties(
          response: response,
          filteredBuyerSellerInfoList: filteredBuyerSellerInfoList,
          localizationsContext: localizationsContext,
        );
        return filteredBuyerSellerInfoList;
      }
    }
    return null;
  }

  static Future<List<BuyerSellerInfo>> _arrangeBrooonMatchingProperties({
    required SharedByBrooonMatchingResponseEntity response,
    required List<BuyerSellerInfo> filteredBuyerSellerInfoList,
    required AppLocalizations localizationsContext,
  }) async {
    if (response.data != null && response.data!.isNotEmpty) {
      final matchingItem =
          LinkedHashMap<String, List<SharedByBrooonMatchingResponseData>>();
      response.data!.forEach(
        (matching) {
          if (matching.type != null && matching.type!.trim().isNotEmpty) {
            if (matchingItem.containsKey(matching.type!.trim())) {
              final list = matchingItem[matching.type!.trim()];
              if (list != null && list.isNotEmpty) {
                list.add(matching);
                matchingItem[matching.type!.trim()] = list;
              } else {
                matchingItem[matching.type!.trim()] = [matching];
              }
            } else {
              matchingItem[matching.type!.trim()] = [matching];
            }
          }
        },
      );
      if (matchingItem.isNotEmpty && filteredBuyerSellerInfoList.isNotEmpty) {
        for (int i = 0; i < filteredBuyerSellerInfoList.length; i++) {
          if (filteredBuyerSellerInfoList[i].inquiries != null &&
              filteredBuyerSellerInfoList[i].inquiries!.isNotEmpty) {
            final brooonMatchingProperties =
                await _getMatchingPropertiesFromInquiries(
              localizationsContext,
              filteredBuyerSellerInfoList[i].inquiries!,
              matchingItem,
            );
            if (filteredBuyerSellerInfoList[i].properties == null) {
              filteredBuyerSellerInfoList[i].properties = [];
            }
            filteredBuyerSellerInfoList[i]
                .properties!
                .addAll(brooonMatchingProperties);
            filteredBuyerSellerInfoList[i].propertyCount =
                filteredBuyerSellerInfoList[i].properties!.length;
          }
        }
      }
    }
    return filteredBuyerSellerInfoList;
  }

  static Future<List<BuyerSellerInfo>> _arrangeBrooonMatchingInquiries({
    required BrooonMatchingInquiryResponseEntity response,
    required List<BuyerSellerInfo> filteredBuyerSellerInfoList,
    required AppLocalizations localizationsContext,
  }) async {
    if (response.data != null && response.data!.isNotEmpty) {
      final matchingItem =
          LinkedHashMap<String, List<BrooonMatchingInquiryResponseData>>();
      response.data!.forEach(
        (matching) {
          if (matching.type != null && matching.type!.trim().isNotEmpty) {
            if (matchingItem.containsKey(matching.type!.trim())) {
              final list = matchingItem[matching.type!.trim()];
              if (list != null && list.isNotEmpty) {
                list.add(matching);
                matchingItem[matching.type!.trim()] = list;
              } else {
                matchingItem[matching.type!.trim()] = [matching];
              }
            } else {
              matchingItem[matching.type!.trim()] = [matching];
            }
          }
        },
      );
      if (matchingItem.isNotEmpty && filteredBuyerSellerInfoList.isNotEmpty) {
        for (int i = 0; i < filteredBuyerSellerInfoList.length; i++) {
          if (filteredBuyerSellerInfoList[i].properties != null &&
              filteredBuyerSellerInfoList[i].properties!.isNotEmpty) {
            final brooonMatchingInquiries =
                await _getMatchingInquiriesFromProperties(
              localizationsContext,
              filteredBuyerSellerInfoList[i].properties!,
              matchingItem,
            );
            if (filteredBuyerSellerInfoList[i].inquiries == null) {
              filteredBuyerSellerInfoList[i].inquiries = [];
            }
            filteredBuyerSellerInfoList[i]
                .inquiries!
                .addAll(brooonMatchingInquiries);
            filteredBuyerSellerInfoList[i].inquiryCount =
                filteredBuyerSellerInfoList[i].inquiries!.length;
          }
        }
      }
    }
    return filteredBuyerSellerInfoList;
  }

  static Future<List<DbSavedFilter>> _getMatchingInquiriesFromProperties(
    AppLocalizations localizationsContext,
    List<DbProperty> properties,
    LinkedHashMap<String, List<BrooonMatchingInquiryResponseData>> response,
  ) async {
    List<DbSavedFilter> brooonMatchingInquiries = [];
    for (int i = 0; i < properties.length; i++) {
      final propertyToMatch = properties[i];
      // match inquiry type
      final List<BrooonMatchingInquiryResponseData> possibleMatchingInquiries =
          [];

      possibleMatchingInquiries.addAll(
        response[propertyToMatch.propertyTypeValue] ?? [],
      );

      if (possibleMatchingInquiries.isNotEmpty) {
        // match inquiry For and Remove not a match entry
        final List<String> xFor = [];
        if (propertyToMatch.propertyForValues != null) {
          xFor.addAll(propertyToMatch.propertyForValues!);
          final isTrue = xFor.any(
            (element) => element == localizationsContext.sell,
          );
          if (isTrue) {
            xFor.removeWhere(
              (element) => element == localizationsContext.sell,
            );
            xFor.add(localizationsContext.buy);
          }
        }

        possibleMatchingInquiries.removeWhere(
          (element) {
            return !(xFor.any(
              (matchFor) =>
                  element.xFor?.any((xFor) => matchFor == xFor) ?? false,
            ));
          },
        );

        // match size and Remove not a match entry
        if (possibleMatchingInquiries.isNotEmpty &&
            propertyToMatch.propertyAreaSize != null) {
          // If size both are there in Inquiry
          // removing inquiries which is not in range of min and max
          possibleMatchingInquiries.removeWhere(
            (element) {
              // To compare values in Range -> making value equal if one of null
              if (element.minAreaSize != null && element.maxAreaSize == null) {
                element.maxAreaSize = element.minAreaSize;
              } else if (element.minAreaSize == null &&
                  element.maxAreaSize != null) {
                element.minAreaSize = element.maxAreaSize;
              }
              // if brooon area size is not null then only check for valid range
              if (element.minAreaSize != null && element.maxAreaSize != null) {
                bool isValidRange =
                    propertyToMatch.propertyAreaSize!.isBetweenOrEqual(
                  element.minAreaSize!,
                  element.maxAreaSize!,
                );
                return !isValidRange;
              }
              return false;
            },
          );
        }

        // match price and Remove not a match entry
        if (possibleMatchingInquiries.isNotEmpty &&
            (propertyToMatch.minSellPrice != null ||
                propertyToMatch.maxSellPrice != null ||
                propertyToMatch.minRentPrice != null ||
                propertyToMatch.maxRentPrice != null ||
                propertyToMatch.minLeasePrice != null ||
                propertyToMatch.maxLeasePrice != null)) {
          // To compare values in Range -> making value equal if one of null
          // Making same value if one of (min / max) is null : Property
          if ((propertyToMatch.minSellPrice != null &&
              propertyToMatch.maxSellPrice == null)) {
            propertyToMatch.maxSellPrice = propertyToMatch.minSellPrice;
          } else if (propertyToMatch.minSellPrice == null &&
              propertyToMatch.maxSellPrice != null) {
            propertyToMatch.minSellPrice = propertyToMatch.maxSellPrice;
          } else if ((propertyToMatch.minRentPrice != null &&
              propertyToMatch.maxRentPrice == null)) {
            propertyToMatch.maxRentPrice = propertyToMatch.minRentPrice;
          } else if (propertyToMatch.minRentPrice == null &&
              propertyToMatch.maxRentPrice != null) {
            propertyToMatch.minRentPrice = propertyToMatch.maxRentPrice;
          } else if ((propertyToMatch.minLeasePrice != null &&
              propertyToMatch.maxLeasePrice == null)) {
            propertyToMatch.maxLeasePrice = propertyToMatch.minLeasePrice;
          } else if (propertyToMatch.minLeasePrice == null &&
              propertyToMatch.maxLeasePrice != null) {
            propertyToMatch.minLeasePrice = propertyToMatch.maxLeasePrice;
          }

          // Making same value if one of (min / max) is null : Matching Inquiries
          for (int l = 0; l < possibleMatchingInquiries.length; l++) {
            if ((possibleMatchingInquiries[l].buyMinPrice != null &&
                possibleMatchingInquiries[l].buyMaxPrice == null)) {
              possibleMatchingInquiries[l].buyMaxPrice =
                  possibleMatchingInquiries[l].buyMinPrice;
            } else if (possibleMatchingInquiries[l].buyMinPrice == null &&
                possibleMatchingInquiries[l].buyMaxPrice != null) {
              possibleMatchingInquiries[l].buyMinPrice =
                  possibleMatchingInquiries[l].buyMaxPrice;
            } else if ((possibleMatchingInquiries[l].rentMinPrice != null &&
                possibleMatchingInquiries[l].rentMaxPrice == null)) {
              possibleMatchingInquiries[l].rentMaxPrice =
                  possibleMatchingInquiries[l].rentMinPrice;
            } else if (possibleMatchingInquiries[l].rentMinPrice == null &&
                possibleMatchingInquiries[l].rentMaxPrice != null) {
              possibleMatchingInquiries[l].rentMinPrice =
                  possibleMatchingInquiries[l].rentMaxPrice;
            } else if ((possibleMatchingInquiries[l].leaseMinPrice != null &&
                possibleMatchingInquiries[l].leaseMaxPrice == null)) {
              possibleMatchingInquiries[l].leaseMaxPrice =
                  possibleMatchingInquiries[l].leaseMinPrice;
            } else if (possibleMatchingInquiries[l].leaseMinPrice == null &&
                possibleMatchingInquiries[l].leaseMaxPrice != null) {
              possibleMatchingInquiries[l].leaseMinPrice =
                  possibleMatchingInquiries[l].leaseMaxPrice;
            }
          }

          // Check if one of inquiries price (Sell, Rent, Lease) is matching with property
          List<String> inquiryIdsToInclude = [];
          for (int m = 0; m < possibleMatchingInquiries.length; m++) {
            // If Both are null - No need to check range comparison
            // From above for loops for properties and matching inquiries
            // -> both are null case is possible.. so its handled here
            if (propertyToMatch.minSellPrice != null &&
                propertyToMatch.maxSellPrice != null) {
              if (possibleMatchingInquiries[m].buyMinPrice != null &&
                  possibleMatchingInquiries[m].buyMaxPrice != null) {
                bool validSellRange =
                    propertyToMatch.minSellPrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].buyMinPrice!,
                          possibleMatchingInquiries[m].buyMaxPrice!,
                        ) ||
                        propertyToMatch.maxSellPrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].buyMinPrice!,
                          possibleMatchingInquiries[m].buyMaxPrice!,
                        );
                if (validSellRange &&
                    possibleMatchingInquiries[m].inquiryId != null) {
                  inquiryIdsToInclude.add(
                    possibleMatchingInquiries[m].inquiryId!,
                  );
                  continue;
                }
              }
            }
            if (propertyToMatch.minRentPrice != null &&
                propertyToMatch.maxRentPrice != null) {
              if (possibleMatchingInquiries[m].rentMinPrice != null &&
                  possibleMatchingInquiries[m].rentMaxPrice != null) {
                bool validRentRange =
                    propertyToMatch.minRentPrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].rentMinPrice!,
                          possibleMatchingInquiries[m].rentMaxPrice!,
                        ) ||
                        propertyToMatch.maxRentPrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].rentMinPrice!,
                          possibleMatchingInquiries[m].rentMaxPrice!,
                        );
                if (validRentRange &&
                    possibleMatchingInquiries[m].inquiryId != null) {
                  inquiryIdsToInclude.add(
                    possibleMatchingInquiries[m].inquiryId!,
                  );
                  continue;
                }
              }
            }
            if (propertyToMatch.minLeasePrice != null &&
                propertyToMatch.maxLeasePrice != null) {
              if (possibleMatchingInquiries[m].leaseMinPrice != null &&
                  possibleMatchingInquiries[m].leaseMaxPrice != null) {
                bool validLeaseRange =
                    propertyToMatch.minLeasePrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].leaseMinPrice!,
                          possibleMatchingInquiries[m].leaseMaxPrice!,
                        ) ||
                        propertyToMatch.maxLeasePrice!.isBetweenOrEqual(
                          possibleMatchingInquiries[m].leaseMinPrice!,
                          possibleMatchingInquiries[m].leaseMaxPrice!,
                        );
                if (validLeaseRange &&
                    possibleMatchingInquiries[m].inquiryId != null) {
                  inquiryIdsToInclude.add(
                    possibleMatchingInquiries[m].inquiryId!,
                  );
                  continue;
                }
              }
            }
          }

          // Remove other properties which not matching with price
          if (inquiryIdsToInclude.isNotEmpty) {
            possibleMatchingInquiries.removeWhere(
              (element) {
                // If not matching with any then remove that entry
                return !inquiryIdsToInclude.any(
                  (id) => id.trim() == ((element.inquiryId) ?? '').trim(),
                );
              },
            );
          } else {
            possibleMatchingInquiries.clear();
          }
        }

        if (possibleMatchingInquiries.isNotEmpty) {
          final matchingInquiries =
              LocationFilterHelper.applyLocationFilterForInquiresIfRequired(
            typedLocation: propertyToMatch.addressLandMark,
            latitude: propertyToMatch.latitude,
            longitude: propertyToMatch.longitude,
            filteredList: await _convertResponseToInquiryList(
              localizationsContext,
              possibleMatchingInquiries,
            ),
          );

          for (int m = 0; m < matchingInquiries.length; m++) {
            // Don't add Inquiry which is already available in brooonMatchingInquiries
            final isMatching = brooonMatchingInquiries.any(
              (element) => element.inquiryId == matchingInquiries[m].inquiryId,
            );
            if (!isMatching) {
              brooonMatchingInquiries.add(matchingInquiries[m]);
            }
          }
        }
      }
    }
    return brooonMatchingInquiries;
  }

  static Future<List<DbProperty>> _getMatchingPropertiesFromInquiries(
    AppLocalizations localizationsContext,
    List<DbSavedFilter> inquiries,
    LinkedHashMap<String, List<SharedByBrooonMatchingResponseData>> response,
  ) async {
    List<DbProperty> brooonMatchingProperties = [];
    for (int i = 0; i < inquiries.length; i++) {
      final inquiryToMatch = inquiries[i];
      // match property type
      if (inquiryToMatch.propertyTypeValues != null) {
        final List<SharedByBrooonMatchingResponseData>
            possibleMatchingProperties = [];
        for (int k = 0; k < inquiryToMatch.propertyTypeValues!.length; k++) {
          possibleMatchingProperties.addAll(
            response[inquiryToMatch.propertyTypeValues![k]] ?? [],
          );
        }
        if (possibleMatchingProperties.isNotEmpty) {
          // match property For and Remove not a match entry
          final List<String> xFor = [];
          if (inquiryToMatch.propertyForValues != null) {
            xFor.addAll(inquiryToMatch.propertyForValues!);
            final isTrue = xFor.any(
              (element) => element == localizationsContext.buy,
            );
            if (isTrue) {
              xFor.removeWhere(
                (element) => element == localizationsContext.buy,
              );
              xFor.add(localizationsContext.sell);
            }
          }

          possibleMatchingProperties.removeWhere(
            (element) {
              return !(xFor.any(
                (matchFor) =>
                    element.xFor?.any((xFor) => matchFor == xFor) ?? false,
              ));
            },
          );

          // match size and Remove not a match entry
          if (possibleMatchingProperties.isNotEmpty &&
              (inquiryToMatch.minMeasure != null ||
                  inquiryToMatch.maxMeasure != null)) {
            // If minMeasure and MaxMeasure both are there in Inquiry
            if (possibleMatchingProperties.isNotEmpty &&
                inquiryToMatch.minMeasure != null &&
                inquiryToMatch.maxMeasure != null) {
              // removing properties which is not in range of min and max
              possibleMatchingProperties.removeWhere(
                (element) {
                  // if area size is not null then only check for valid range
                  if (element.areaSize != null) {
                    return (inquiryToMatch.maxMeasure! > element.areaSize!) &&
                        (element.areaSize! < inquiryToMatch.minMeasure!);
                  }
                  return false;
                },
              );
            } else {
              // If only entry of minMeasure
              if (possibleMatchingProperties.isNotEmpty &&
                  inquiryToMatch.minMeasure != null) {
                // removing properties which not matching min measure (size)
                possibleMatchingProperties.removeWhere(
                  (element) {
                    // if area size is not null then only check for valid range
                    if (element.areaSize != null) {
                      return element.areaSize! < inquiryToMatch.minMeasure!;
                    }
                    return false; // returning false as we don't need to remove null size entry
                  },
                );
              }

              // If only entry of maxMeasure
              if (possibleMatchingProperties.isNotEmpty &&
                  inquiryToMatch.maxMeasure != null) {
                // removing properties which not matching max measure (size)
                possibleMatchingProperties.removeWhere(
                  (element) {
                    // if area size is not null then only check for valid range
                    if (element.areaSize != null) {
                      return element.areaSize! > inquiryToMatch.maxMeasure!;
                    }
                    return false; // returning false as we don't need to remove null size entry
                  },
                );
              }
            }
          }

          // match price and Remove not a match entry
          if (possibleMatchingProperties.isNotEmpty &&
              (inquiryToMatch.sellPriceRangeMin != null ||
                  inquiryToMatch.sellPriceRangeMax != null ||
                  inquiryToMatch.rentPriceRangeMin != null ||
                  inquiryToMatch.rentPriceRangeMax != null ||
                  inquiryToMatch.leasePriceRangeMin != null ||
                  inquiryToMatch.leasePriceRangeMax != null)) {
            // To compare values in Range -> making value equal if one of null
            // Making same value if one of (min / max) is null : Inquiry
            if ((inquiryToMatch.sellPriceRangeMin != null &&
                inquiryToMatch.sellPriceRangeMax == null)) {
              inquiryToMatch.sellPriceRangeMax =
                  inquiryToMatch.sellPriceRangeMin;
            } else if (inquiryToMatch.sellPriceRangeMin == null &&
                inquiryToMatch.sellPriceRangeMax != null) {
              inquiryToMatch.sellPriceRangeMin =
                  inquiryToMatch.sellPriceRangeMax;
            } else if ((inquiryToMatch.rentPriceRangeMin != null &&
                inquiryToMatch.rentPriceRangeMax == null)) {
              inquiryToMatch.rentPriceRangeMax =
                  inquiryToMatch.rentPriceRangeMin;
            } else if (inquiryToMatch.rentPriceRangeMin == null &&
                inquiryToMatch.rentPriceRangeMax != null) {
              inquiryToMatch.rentPriceRangeMin =
                  inquiryToMatch.rentPriceRangeMax;
            } else if ((inquiryToMatch.leasePriceRangeMin != null &&
                inquiryToMatch.leasePriceRangeMax == null)) {
              inquiryToMatch.leasePriceRangeMax =
                  inquiryToMatch.leasePriceRangeMin;
            } else if (inquiryToMatch.leasePriceRangeMin == null &&
                inquiryToMatch.leasePriceRangeMax != null) {
              inquiryToMatch.leasePriceRangeMin =
                  inquiryToMatch.leasePriceRangeMax;
            }

            // Making same value if one of (min / max) is null : Matching Properties
            for (int l = 0; l < possibleMatchingProperties.length; l++) {
              if ((possibleMatchingProperties[l].sellMinPrice != null &&
                  possibleMatchingProperties[l].sellMaxPrice == null)) {
                possibleMatchingProperties[l].sellMaxPrice =
                    possibleMatchingProperties[l].sellMinPrice;
              } else if (possibleMatchingProperties[l].sellMinPrice == null &&
                  possibleMatchingProperties[l].sellMaxPrice != null) {
                possibleMatchingProperties[l].sellMinPrice =
                    possibleMatchingProperties[l].sellMaxPrice;
              } else if ((possibleMatchingProperties[l].rentMinPrice != null &&
                  possibleMatchingProperties[l].rentMaxPrice == null)) {
                possibleMatchingProperties[l].rentMaxPrice =
                    possibleMatchingProperties[l].rentMinPrice;
              } else if (possibleMatchingProperties[l].rentMinPrice == null &&
                  possibleMatchingProperties[l].rentMaxPrice != null) {
                possibleMatchingProperties[l].rentMinPrice =
                    possibleMatchingProperties[l].rentMaxPrice;
              } else if ((possibleMatchingProperties[l].leaseMinPrice != null &&
                  possibleMatchingProperties[l].leaseMaxPrice == null)) {
                possibleMatchingProperties[l].leaseMaxPrice =
                    possibleMatchingProperties[l].leaseMinPrice;
              } else if (possibleMatchingProperties[l].leaseMinPrice == null &&
                  possibleMatchingProperties[l].leaseMaxPrice != null) {
                possibleMatchingProperties[l].leaseMinPrice =
                    possibleMatchingProperties[l].leaseMaxPrice;
              }
            }

            // Check if one of properties price (Sell, Rent, Lease) is matching with inquiry
            List<String> propertyIdsToInclude = [];
            for (int m = 0; m < possibleMatchingProperties.length; m++) {
              // If Both are null - No need to check range comparison
              // From above for loops for inquiries and matching properties
              // -> both are null case is possible.. so its handled here
              if (inquiryToMatch.sellPriceRangeMin != null &&
                  inquiryToMatch.sellPriceRangeMax != null) {
                if (possibleMatchingProperties[m].sellMinPrice != null &&
                    possibleMatchingProperties[m].sellMaxPrice != null) {
                  bool validSellRange =
                      inquiryToMatch.sellPriceRangeMin!.isBetweenOrEqual(
                            possibleMatchingProperties[m].sellMinPrice!,
                            possibleMatchingProperties[m].sellMaxPrice!,
                          ) ||
                          inquiryToMatch.sellPriceRangeMax!.isBetweenOrEqual(
                            possibleMatchingProperties[m].sellMinPrice!,
                            possibleMatchingProperties[m].sellMaxPrice!,
                          );
                  if (validSellRange &&
                      possibleMatchingProperties[m].propertyId != null) {
                    propertyIdsToInclude.add(
                      possibleMatchingProperties[m].propertyId!,
                    );
                    continue;
                  }
                }
              }
              if (inquiryToMatch.rentPriceRangeMin != null &&
                  inquiryToMatch.rentPriceRangeMax != null) {
                if (possibleMatchingProperties[m].rentMinPrice != null &&
                    possibleMatchingProperties[m].rentMaxPrice != null) {
                  bool validRentRange =
                      inquiryToMatch.rentPriceRangeMin!.isBetweenOrEqual(
                            possibleMatchingProperties[m].rentMinPrice!,
                            possibleMatchingProperties[m].rentMaxPrice!,
                          ) ||
                          inquiryToMatch.rentPriceRangeMax!.isBetweenOrEqual(
                            possibleMatchingProperties[m].rentMinPrice!,
                            possibleMatchingProperties[m].rentMaxPrice!,
                          );
                  if (validRentRange &&
                      possibleMatchingProperties[m].propertyId != null) {
                    propertyIdsToInclude.add(
                      possibleMatchingProperties[m].propertyId!,
                    );
                    continue;
                  }
                }
              }
              if (inquiryToMatch.leasePriceRangeMin != null &&
                  inquiryToMatch.leasePriceRangeMax != null) {
                if (possibleMatchingProperties[m].leaseMinPrice != null &&
                    possibleMatchingProperties[m].leaseMaxPrice != null) {
                  bool validLeaseRange =
                      inquiryToMatch.leasePriceRangeMin!.isBetweenOrEqual(
                            possibleMatchingProperties[m].leaseMinPrice!,
                            possibleMatchingProperties[m].leaseMaxPrice!,
                          ) ||
                          inquiryToMatch.leasePriceRangeMax!.isBetweenOrEqual(
                            possibleMatchingProperties[m].leaseMinPrice!,
                            possibleMatchingProperties[m].leaseMaxPrice!,
                          );
                  if (validLeaseRange &&
                      possibleMatchingProperties[m].propertyId != null) {
                    propertyIdsToInclude.add(
                      possibleMatchingProperties[m].propertyId!,
                    );
                    continue;
                  }
                }
              }
            }

            // Remove other properties which not matching with price
            if (propertyIdsToInclude.isNotEmpty) {
              possibleMatchingProperties.removeWhere(
                (element) {
                  // If not matching with any then remove that entry
                  return !propertyIdsToInclude.any(
                    (id) => id.trim() == ((element.propertyId) ?? '').trim(),
                  );
                },
              );
            } else {
              // Remove all properties
              possibleMatchingProperties.clear();
            }
          }

          if (possibleMatchingProperties.isNotEmpty) {
            final matchingProperties =
                LocationFilterHelper.applyLocationFilterForPropertiesIfRequired(
              typedLocation: inquiryToMatch.location,
              latitude: inquiryToMatch.latitude,
              longitude: inquiryToMatch.longitude,
              filteredList: await _convertResponseToPropertyList(
                possibleMatchingProperties,
              ),
            );
            for (int m = 0; m < matchingProperties.length; m++) {
              // Don't add property which is already available in brooonMatchingProperties
              final isMatching = brooonMatchingProperties.any(
                (element) =>
                    element.propertyId == matchingProperties[m].propertyId,
              );
              if (!isMatching) {
                brooonMatchingProperties.add(matchingProperties[m]);
              }
            }
          }
        }
      }
    }
    return brooonMatchingProperties;
  }

  static Future<List<DbProperty>> _convertResponseToPropertyList(
    List<SharedByBrooonMatchingResponseData> matches,
  ) async {
    List<DbProperty> brooonProperties = [];
    final isarService = IsarService();
    for (int i = 0; i < matches.length; i++) {
      final propertyInfo = matches[i];
      List<int> propertyForIds = [];
      if (propertyInfo.xFor != null && propertyInfo.xFor!.isNotEmpty) {
        for (int j = 0; j < propertyInfo.xFor!.length; j++) {
          propertyForIds.add(
            await isarService.getPropertyForIdByName(
              propertyInfo.xFor![j],
            ),
          );
        }
      }

      DbProperty property = DbProperty()
        ..propertyId = propertyInfo.propertyId
        ..isSyncedWithServer = true
        ..isEdit = false
        ..userId = StaticFunctions.userId
        ..propertyName = propertyInfo.name ?? ''
        ..propertyTypeId = await isarService.getPropertyTypeIdByName(
          propertyInfo.type,
        )
        ..propertyTypeValue = propertyInfo.type ?? ''
        ..propertyForIds = propertyForIds
        ..propertyForValues = propertyInfo.xFor
        ..propertyStatusId = await isarService.getPropertyStatusIdByName(
          propertyInfo.propertyStatus,
        )
        ..propertyStatusValue = propertyInfo.propertyStatus ?? ''
        ..propertySoldStatusId =
            propertyInfo.propertySoldStatusId ?? SaveDefaultData.unSoldStatusId
        ..closeDealId = propertyInfo.closeDealId
        ..addedAt = DateTime.fromMillisecondsSinceEpoch(
          propertyInfo.createdAt ?? 0,
        )
        ..updatedAt = DateTime.fromMillisecondsSinceEpoch(
          propertyInfo.updatedAt ?? 0,
        )
        ..propertyFurnishedStatusId = propertyInfo.propertyFurnishedType != null
            ? (await isarService.getFurnishedStatusIdByName(
                [propertyInfo.propertyFurnishedType!],
              ))
                ?.first
            : null
        ..roomCount = propertyInfo.room
        ..bathRoomCount = propertyInfo.bathRoom
        ..floorCount = propertyInfo.floor
        ..totalFloorCount = propertyInfo.totalFloor
        ..minSellPrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.sellMinPrice,
        )
            ? double.parse(propertyInfo.sellMinPrice!.toString())
            : null
        ..maxSellPrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.sellMaxPrice,
        )
            ? double.parse(propertyInfo.sellMaxPrice!.toString())
            : null
        ..minSellPriceUnit = propertyInfo.sellMinPriceUnitId != null
            ? propertyInfo.sellMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..maxSellPriceUnit = propertyInfo.sellMaxPriceUnitId != null
            ? propertyInfo.sellMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..minRentPrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.rentMinPrice,
        )
            ? double.parse(propertyInfo.rentMinPrice!.toString())
            : null
        ..maxRentPrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.rentMaxPrice,
        )
            ? double.parse(propertyInfo.rentMaxPrice!.toString())
            : null
        ..minRentPriceUnit = propertyInfo.rentMinPriceUnitId != null
            ? propertyInfo.rentMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..maxRentPriceUnit = propertyInfo.rentMaxPriceUnitId != null
            ? propertyInfo.rentMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..minLeasePrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.leaseMinPrice,
        )
            ? double.parse(propertyInfo.leaseMinPrice!.toString())
            : null
        ..maxLeasePrice = CommonPropertyDataProvider.checkForValidPrice(
          propertyInfo.leaseMaxPrice,
        )
            ? double.parse(propertyInfo.leaseMaxPrice!.toString())
            : null
        ..minLeasePriceUnit = propertyInfo.leaseMinPriceUnitId != null
            ? propertyInfo.leaseMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..maxLeasePriceUnit = propertyInfo.leaseMaxPriceUnitId != null
            ? propertyInfo.leaseMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..frontSize = propertyInfo.frontSize
        ..depthSize = propertyInfo.depthSize
        ..additionalFurnishing = propertyInfo.additionalFurnishing
        ..amenitiesValues = propertyInfo.amenities
        ..preferredCommunityValues = propertyInfo.preferredCaste
        ..tags = propertyInfo.tags
        ..buildingTypeId = propertyInfo.buildingType != null
            ? (await isarService
                    .getBuildingTypeIdByName([propertyInfo.buildingType!]))
                ?.first
            : null
        ..facingId = propertyInfo.facing != null
            ? (await isarService.getFacingTypeIdByName([propertyInfo.facing!]))
                ?.first
            : null
        ..schemeTypeId = propertyInfo.schemeType != null
            ? (await isarService
                    .getSchemeTypeIdByName([propertyInfo.schemeType!]))
                ?.first
            : null
        ..connectedRoads = propertyInfo.connectedRoad
        ..constructionTypeId = propertyInfo.constructionType != null
            ? (await isarService.getConstructionTypeIdByName(
                    [propertyInfo.constructionType!]))
                ?.first
            : null
        ..bhkId = propertyInfo.bhk != null
            ? (await isarService.getBhkTypeIdByName([propertyInfo.bhk!]))?.first
            : null
        ..balcony = propertyInfo.balcony
        ..isCornerPiece = propertyInfo.cornerPiece
        ..lightConnection = propertyInfo.lightConnection
        ..isWellAvailable = propertyInfo.wellAvailable
        ..isParkingAvailable = propertyInfo.parkingAvailable
        ..isLiftAvailable = propertyInfo.liftAvailable
        ..isAllottedParking = propertyInfo.allottedParking
        ..isWashRoomAvailable = propertyInfo.washRoomAvailable
        ..exchangeAllowed = propertyInfo.exchangeAllowed ?? false
        ..negotiationAllowed = propertyInfo.negotiationAllowed ?? false
        ..comments = propertyInfo.note
        ..brokerChain = propertyInfo.brokerChain
        ..priceUnitId =
            await isarService.getPriceUnitIdByName(propertyInfo.priceUnit)
        ..priceUnitValue = propertyInfo.priceUnit
        ..propertyAreaSize = propertyInfo.areaSize
        ..propertyAreaUnitId =
            await isarService.getPropertyAreaUnitIdByName(propertyInfo.areaUnit)
        ..propertyAreaUnitValue = propertyInfo.areaUnit
        ..propertySellPricePerArea = (propertyInfo.sellPriceBySize != null &&
                propertyInfo.sellPriceBySize!.toString().trim().isNotEmpty)
            ? double.parse(propertyInfo.sellPriceBySize.toString())
            : null
        ..propertyRentPricePerArea = (propertyInfo.rentPriceBySize != null &&
                propertyInfo.rentPriceBySize!.toString().trim().isNotEmpty)
            ? double.parse(propertyInfo.rentPriceBySize.toString())
            : null
        ..propertyLeasePricePerArea = (propertyInfo.leasePriceBySize != null &&
                propertyInfo.leasePriceBySize!.toString().trim().isNotEmpty)
            ? double.parse(propertyInfo.leasePriceBySize.toString())
            : null
        ..propertyPricePerAreaUnitId = await isarService.getPriceUnitIdByName(
          propertyInfo.priceBySizeUnit,
        )
        ..propertyPricePerAreaUnitValue = propertyInfo.priceBySizeUnit
        ..publicAddressLandMark = propertyInfo.publicLocation
        ..publicArea = propertyInfo.publicLocation
        ..publicLatitude = propertyInfo.publicLatitude
        ..publicLongitude = propertyInfo.publicLongitude
        ..isPublicProperty = true
        ..sharedByBrooon = true
        ..brooonId = propertyInfo.brooonInfo?.brooonId
        ..brooonCode = propertyInfo.brooonInfo?.brooonCode
        ..brooonName =
            '${propertyInfo.brooonInfo?.firstName} ${propertyInfo.brooonInfo?.lastName}'
        ..brooonPhone = propertyInfo.brooonInfo?.mobileNumber
        ..brooonPhoto = propertyInfo.brooonInfo?.brooonPhoto
        ..associationId =
            propertyInfo.brooonInfo?.associationInfo?.associationId
        ..associationCode =
            propertyInfo.brooonInfo?.associationInfo?.associationCode
        ..associationPhoto =
            propertyInfo.brooonInfo?.associationInfo?.associationPhoto;
      brooonProperties.add(property);
    }
    return brooonProperties;
  }

  static Future<List<DbSavedFilter>> _convertResponseToInquiryList(
    AppLocalizations localizationsContext,
    List<BrooonMatchingInquiryResponseData> matches,
  ) async {
    List<DbSavedFilter> brooonInquiries = [];
    final isarService = IsarService();
    for (int i = 0; i < matches.length; i++) {
      final inquiryInfo = matches[i];
      List<int> propertyForIds = [];

      if (inquiryInfo.xFor != null && inquiryInfo.xFor!.isNotEmpty) {
        for (int j = 0; j < inquiryInfo.xFor!.length; j++) {
          final propertyFor = inquiryInfo.xFor![j];
          propertyForIds.add(
            await isarService.getPropertyForIdByName(
              propertyFor == localizationsContext.buy
                  ? localizationsContext.sell
                  : propertyFor,
            ),
          );
        }
      }

      DbSavedFilter inquiry = DbSavedFilter()
        ..inquiryId = inquiryInfo.inquiryId
        ..isSyncedWithServer = true
        ..isFromBuyer = true
        ..userId = StaticFunctions.userId
        ..filterName = inquiryInfo.name ?? ''
        ..propertyType = [
          await isarService.getPropertyTypeIdByName(
            inquiryInfo.type,
          )
        ]
        ..propertyTypeValues = [inquiryInfo.type ?? '']
        ..propertyFor = propertyForIds
        ..propertyForValues = inquiryInfo.xFor
        ..inquiryStatusId = await isarService.getPropertyStatusIdByName(
          inquiryInfo.inquiryStatus,
        )
        ..inquiryStatusValue = inquiryInfo.inquiryStatus ?? ''
        ..inquirySoldStatusId =
            inquiryInfo.inquirySoldStatusId ?? SaveDefaultData.unSoldStatusId
        ..closeDealId = inquiryInfo.closeDealId
        ..addedAt = DateTime.fromMillisecondsSinceEpoch(
          inquiryInfo.createdAt ?? 0,
        )
        ..updatedAt = DateTime.fromMillisecondsSinceEpoch(
          inquiryInfo.updatedAt ?? 0,
        )
        ..furnishedType = await isarService.getFurnishedStatusIdByName(
          inquiryInfo.propertyFurnishedType,
        )
        ..roomCount = inquiryInfo.room
        ..bathroomCount = inquiryInfo.bathRoom
        ..floorCount = inquiryInfo.floor
        ..totalFloorCount = inquiryInfo.totalFloor
        ..sellPriceRangeMin = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.buyMinPrice,
        )
            ? double.parse(inquiryInfo.buyMinPrice!.toString())
            : null
        ..sellPriceRangeMax = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.buyMaxPrice,
        )
            ? double.parse(inquiryInfo.buyMaxPrice!.toString())
            : null
        ..sellMinPriceUnit = inquiryInfo.buyMinPriceUnitId != null
            ? inquiryInfo.buyMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..sellMaxPriceUnit = inquiryInfo.buyMaxPriceUnitId != null
            ? inquiryInfo.buyMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..rentPriceRangeMin = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.rentMinPrice,
        )
            ? double.parse(inquiryInfo.rentMinPrice!.toString())
            : null
        ..rentPriceRangeMax = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.rentMaxPrice,
        )
            ? double.parse(inquiryInfo.rentMaxPrice!.toString())
            : null
        ..rentMinPriceUnit = inquiryInfo.rentMinPriceUnitId != null
            ? inquiryInfo.rentMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..rentMaxPriceUnit = inquiryInfo.rentMaxPriceUnitId != null
            ? inquiryInfo.rentMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..leasePriceRangeMin = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.leaseMinPrice,
        )
            ? double.parse(inquiryInfo.leaseMinPrice!.toString())
            : null
        ..leasePriceRangeMax = CommonPropertyDataProvider.checkForValidPrice(
          inquiryInfo.leaseMaxPrice,
        )
            ? double.parse(inquiryInfo.leaseMaxPrice!.toString())
            : null
        ..leaseMinPriceUnit = inquiryInfo.leaseMinPriceUnitId != null
            ? inquiryInfo.leaseMinPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..leaseMaxPriceUnit = inquiryInfo.leaseMaxPriceUnitId != null
            ? inquiryInfo.leaseMaxPriceUnitId!
            : SaveDefaultData.filterPriceUnitThousand
        ..frontSize = inquiryInfo.frontSize
        ..depthSize = inquiryInfo.depthSize
        ..additionalFurnish = inquiryInfo.additionalFurnishing
        ..selectedAmenities = inquiryInfo.amenities
        ..preferredCaste = inquiryInfo.preferredCaste
        ..buildingType =
            await isarService.getBuildingTypeIdByName(inquiryInfo.buildingType)
        ..facingType =
            await isarService.getFacingTypeIdByName(inquiryInfo.facing)
        ..schemeType =
            await isarService.getSchemeTypeIdByName(inquiryInfo.schemeType)
        ..connectedRoads = inquiryInfo.connectedRoad
        ..constructionType = await isarService.getConstructionTypeIdByName(
          inquiryInfo.constructionType,
        )
        ..bhkIds = await isarService.getBhkTypeIdByName(inquiryInfo.bhk)
        ..isBalconyAvailable = inquiryInfo.balcony
        ..isCornerPiece = inquiryInfo.cornerPiece
        ..isLightConnectionAvailable = inquiryInfo.lightConnection
        ..isWellAvailable = inquiryInfo.wellAvailable
        ..isParkingAvailable = inquiryInfo.parkingAvailable
        ..isLiftAvailable = inquiryInfo.liftAvailable
        ..isAllottedParkingAvailable = inquiryInfo.allottedParking
        ..isWashroomAvailable = inquiryInfo.washRoomAvailable
        ..isNegotiable = inquiryInfo.negotiationAllowed ?? false
        ..notes = inquiryInfo.note
        ..minMeasure = inquiryInfo.minAreaSize
        ..maxMeasure = inquiryInfo.maxAreaSize
        ..measureUnit =
            await isarService.getPropertyAreaUnitIdByName(inquiryInfo.areaUnit)
        ..measureUnitValue = inquiryInfo.areaUnit
        ..sellMinPricePerSize = (inquiryInfo.buyMinPriceBySize != null &&
                inquiryInfo.buyMinPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.buyMinPriceBySize.toString())
            : null
        ..sellMaxPricePerSize = (inquiryInfo.buyMaxPriceBySize != null &&
                inquiryInfo.buyMaxPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.buyMaxPriceBySize.toString())
            : null
        ..rentMinPricePerSize = (inquiryInfo.rentMinPriceBySize != null &&
                inquiryInfo.rentMinPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.rentMinPriceBySize.toString())
            : null
        ..rentMaxPricePerSize = (inquiryInfo.rentMaxPriceBySize != null &&
                inquiryInfo.rentMaxPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.rentMaxPriceBySize.toString())
            : null
        ..leaseMinPricePerSize = (inquiryInfo.leaseMinPriceBySize != null &&
                inquiryInfo.leaseMinPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.leaseMinPriceBySize.toString())
            : null
        ..leaseMaxPricePerSize = (inquiryInfo.leaseMaxPriceBySize != null &&
                inquiryInfo.leaseMaxPriceBySize!.toString().trim().isNotEmpty)
            ? double.tryParse(inquiryInfo.leaseMaxPriceBySize.toString())
            : null
        ..area = inquiryInfo.mapLocation
        ..location = inquiryInfo.typedLocation
        ..latitude = inquiryInfo.latitude
        ..longitude = inquiryInfo.longitude
        ..isPublicInquiry = true
        ..sharedByBrooon = true
        ..brooonId = inquiryInfo.brooonInfo?.brooonId
        ..brooonCode = inquiryInfo.brooonInfo?.brooonCode
        ..brooonName =
            '${inquiryInfo.brooonInfo?.firstName} ${inquiryInfo.brooonInfo?.lastName}'
        ..brooonPhone = inquiryInfo.brooonInfo?.mobileNumber
        ..brooonPhoto = inquiryInfo.brooonInfo?.brooonPhoto
        ..associationId = inquiryInfo.brooonInfo?.associationInfo?.associationId
        ..associationCode =
            inquiryInfo.brooonInfo?.associationInfo?.associationCode
        ..associationPhoto =
            inquiryInfo.brooonInfo?.associationInfo?.associationPhoto;
      brooonInquiries.add(inquiry);
    }
    return brooonInquiries;
  }
}
