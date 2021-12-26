import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPhotosWidget extends StatefulWidget {
  const NewsPhotosWidget({Key key}) : super(key: key);

  @override
  _NewsPhotosWidgetState createState() => _NewsPhotosWidgetState();
}

class _NewsPhotosWidgetState extends State<NewsPhotosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
    );
  }
}
