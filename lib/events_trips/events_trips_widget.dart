import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsTripsWidget extends StatefulWidget {
  const EventsTripsWidget({Key key}) : super(key: key);

  @override
  _EventsTripsWidgetState createState() => _EventsTripsWidgetState();
}

class _EventsTripsWidgetState extends State<EventsTripsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
    );
  }
}
