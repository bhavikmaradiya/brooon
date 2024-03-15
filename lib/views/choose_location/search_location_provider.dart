import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './api_response/google_places_response_entity.dart';
import './model/location_content.dart';
import '../../network/dio_client.dart';

class SearchLocationProvider extends ChangeNotifier {
  final List<LocationContent> _places = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set updateLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<LocationContent> get places => _places;
  late AppLocalizations localizationsContext;

  init(AppLocalizations localizationsContext) {
    this.localizationsContext = localizationsContext;
  }

  Future<GooglePlacesResponseEntity?> searchPlaces(String queryText) async {
    return await DioClient.locationApi().findPlaces(queryText);
  }

  updatePlacesList(List<GooglePlacesResponsePredictions> predictions) {
    _places.clear();
    predictions.forEach(
          (element) {
        _places.add(
          LocationContent(
            landMark: element.structuredFormatting?.mainText ??
                localizationsContext.unknownLocation,
            address: element.structuredFormatting?.secondaryText ??
                localizationsContext.unknownLocation,
            description:
            element.description ?? localizationsContext.unknownLocation,
            googlePlaceId: element.placeId,
          ),
        );
      },
    );
    notifyListeners();
  }
}
