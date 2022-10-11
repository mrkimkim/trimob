import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

LatLng getUsersLocation(LatLng? userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

LatLng getSelectedPlaceLatLng(List<FFPlace> places) {
  // returns latlng of the first element in the given list
  if (places.isEmpty) {
    return LatLng(0, 0);
  }
  return places.first.latLng;
}

List<FFPlace> createPlaceList(FFPlace place) {
  // returns a list which contains the first argument
  List<FFPlace> list = List.filled(1, place);
  return list;
}
