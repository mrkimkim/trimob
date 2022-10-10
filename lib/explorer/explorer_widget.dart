import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorerWidget extends StatefulWidget {
  const ExplorerWidget({Key? key}) : super(key: key);

  @override
  _ExplorerWidgetState createState() => _ExplorerWidgetState();
}

class _ExplorerWidgetState extends State<ExplorerWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  var placePickerValue = FFPlace();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: FlutterFlowTheme.of(context).primaryColor,
          ),
        ),
      );
    }
    return StreamBuilder<List<MarkerRecord>>(
      stream: queryMarkerRecord(
        queryBuilder: (markerRecord) =>
            markerRecord.where('user', isEqualTo: currentUserUid),
        limit: 50,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<MarkerRecord> explorerMarkerRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await signOut();

                              context.goNamedAuth('SignIn', mounted);
                            },
                            text: 'Logout',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey:
                            'AIzaSyCrlBVhX6kcgiDDCWqCxXzYgOXZRmnBSYM',
                        androidGoogleMapsApiKey:
                            'AIzaSyDeZlDA_yRMtfdr9XDRPGZGuicPNF8fmog',
                        webGoogleMapsApiKey:
                            'AIzaSyCx6zzbkU6YjrU5hpqPY9TKXoQVRwUAAi4',
                        onSelect: (place) async {
                          setState(() => placePickerValue = place);
                        },
                        defaultText: 'Select Location',
                        icon: Icon(
                          Icons.place,
                          color: Colors.white,
                          size: 16,
                        ),
                        buttonOptions: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FlutterFlowGoogleMap(
                      controller: googleMapsController,
                      onCameraIdle: (latLng) =>
                          setState(() => googleMapsCenter = latLng),
                      initialLocation: googleMapsCenter ??=
                          functions.getUsersLocation(currentUserLocationValue),
                      markers: explorerMarkerRecordList
                          .map(
                            (explorerMarkerRecord) => FlutterFlowMarker(
                              explorerMarkerRecord.reference.path,
                              explorerMarkerRecord.location!,
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.violet,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: true,
                      showMapToolbar: true,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
