import '../backend/backend.dart';
import '../components/bs_menu_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Image.asset(
            'assets/images/ega_overlay_retina.png',
            width: 60,
            height: 60,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          'Altitude',
          style: FlutterFlowTheme.title1,
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
              child: InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BsMenuWidget(),
                      );
                    },
                  );
                },
                child: FaIcon(
                  FontAwesomeIcons.shoePrints,
                  color: FlutterFlowTheme.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: StreamBuilder<List<AltitudeRecord>>(
        stream: queryAltitudeRecord(),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.primaryColor,
                ),
              ),
            );
          }
          List<AltitudeRecord> googleMapAltitudeRecordList = snapshot.data;
          return FlutterFlowGoogleMap(
            controller: googleMapsController,
            onCameraIdle: (latLng) => googleMapsCenter = latLng,
            initialLocation: googleMapsCenter ??=
                LatLng(34.1428367, 132.2251835),
            markers: (googleMapAltitudeRecordList ?? [])
                .map(
                  (googleMapAltitudeRecord) => FlutterFlowMarker(
                    googleMapAltitudeRecord.reference.path,
                    googleMapAltitudeRecord.map,
                  ),
                )
                .toList(),
            markerColor: GoogleMarkerColor.blue,
            mapType: MapType.normal,
            style: GoogleMapStyle.standard,
            initialZoom: 14,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: false,
            showLocation: true,
            showCompass: false,
            showMapToolbar: false,
            showTraffic: true,
            centerMapOnMarkerTap: true,
          );
        },
      ),
    );
  }
}
