import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelGuideWidget extends StatefulWidget {
  const TravelGuideWidget({Key key}) : super(key: key);

  @override
  _TravelGuideWidgetState createState() => _TravelGuideWidgetState();
}

class _TravelGuideWidgetState extends State<TravelGuideWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.format_line_spacing_outlined,
          color: FlutterFlowTheme.white,
          size: 24,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
    );
  }
}
