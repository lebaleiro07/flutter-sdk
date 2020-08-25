import 'package:music_playce_sdk/core/api/endpoints/places_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/places/place_response.model.dart';

import '../models/users/user_playlists_response.model.dart';

/// The abstract class for PlacesRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the places endpoints
abstract class PlacesRepository {

  /// Sends an HTTP request to the places endpoint in order to
  /// get all states
  ///
  /// The request is made to [PlacesEndpoint.getStates]
  ///
  /// This will return all states in a [StatesResponse] format
  Future<List<PlaceResponse>> getStates();

  /// Sends an HTTP request to the places endpoint in order to
  /// get all places
  ///
  /// The request is made to [PlacesEndpoint.getCities]
  /// it recieves a [String] that is a [stateId]
  ///
  /// This will return all states in a [cities] format
  Future<List<PlaceResponse>> getCities(String stateId);

}
