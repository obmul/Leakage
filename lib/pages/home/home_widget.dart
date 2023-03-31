import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      final leaksCreateData = createLeaksRecordData(
        location: currentUserLocationValue,
        reportedBy: currentUserReference,
        createdAt: getCurrentTimestamp,
      );
      await LeaksRecord.collection.doc().set(leaksCreateData);
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1.0,
                          decoration: BoxDecoration(),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(builder: (context) {
                          final _googleMapMarker = currentUserLocationValue;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => setState(
                                () => _model.googleMapsCenter = latLng),
                            initialLocation: _model.googleMapsCenter ??=
                                LatLng(3.3869, 36.683),
                            markers: [
                              if (_googleMapMarker != null)
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                ),
                            ],
                            markerColor: GoogleMarkerColor.blue,
                            mapType: MapType.satellite,
                            style: GoogleMapStyle.night,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: true,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        }),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.06, 0.79),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownController ??=
                              FormFieldController<int>(
                            _model.dropDownValue ??= 1,
                          ),
                          options: [1, 2, 3],
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'zxs6v9d5' /* Critical */,
                            ),
                            FFLocalizations.of(context).getText(
                              '0oc48fad' /* High */,
                            ),
                            FFLocalizations.of(context).getText(
                              '0i4z7v9a' /* low */,
                            )
                          ],
                          onChanged: (val) async {
                            setState(() => _model.dropDownValue = val);
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));

                            final leaksCreateData = createLeaksRecordData(
                              location: currentUserLocationValue,
                              createdAt: getCurrentTimestamp,
                              reportedBy: currentUserReference,
                            );
                            await LeaksRecord.collection
                                .doc()
                                .set(leaksCreateData);
                          },
                          width: 180.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 29.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w900,
                                    lineHeight: 4.0,
                                  ),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'glhv7lpm' /*  level of risk */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            '300wqku5' /* Search for an item... */,
                          ),
                          icon: Icon(
                            Icons.hardware,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 15.0,
                          ),
                          fillColor: Color(0xFF137BEC),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 23.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
