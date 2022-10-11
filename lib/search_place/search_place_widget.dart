import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPlaceWidget extends StatefulWidget {
  const SearchPlaceWidget({Key? key}) : super(key: key);

  @override
  _SearchPlaceWidgetState createState() => _SearchPlaceWidgetState();
}

class _SearchPlaceWidgetState extends State<SearchPlaceWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var placePickerValue = FFPlace();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowPlacePicker(
                iOSGoogleMapsApiKey: 'AIzaSyCrlBVhX6kcgiDDCWqCxXzYgOXZRmnBSYM',
                androidGoogleMapsApiKey:
                    'AIzaSyDeZlDA_yRMtfdr9XDRPGZGuicPNF8fmog',
                webGoogleMapsApiKey: 'AIzaSyCx6zzbkU6YjrU5hpqPY9TKXoQVRwUAAi4',
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
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    'Explorer',
                    queryParams: {
                      'selectedPlace': serializeParam(
                        functions.createPlaceList(placePickerValue),
                        ParamType.FFPlace,
                        true,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
