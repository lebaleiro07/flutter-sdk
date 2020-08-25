import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_playce_sdk/core/api/endpoints/places_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/places/place_response.model.dart';
import 'package:music_playce_sdk/core/api/repositories/places_repository.dart';
import 'package:music_playce_sdk/core/http/music_playce_http.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  final MusicPlayceHttp httpClient;

  PlacesRepositoryImpl({
    @required this.httpClient,
  });

  @override
  Future<List<PlaceResponse>> getStates() async {
    try {
      final response = await httpClient.get(PlacesEndpoint.getStates);

      final json = jsonDecode(response?.body)['data'];

      return json
          .map<PlaceResponse>((place) => PlaceResponse.fromMap(place))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<PlaceResponse>> getCities(String stateId) async {
    try {
      final response = await httpClient.get(PlacesEndpoint.getCities(stateId));

      final json = jsonDecode(response?.body)['data'];

      return json
          .map<PlaceResponse>((place) => PlaceResponse.fromMap(place))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
