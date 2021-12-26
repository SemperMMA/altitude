import '../backend/backend.dart';
import '../components/side_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightPlanWidget extends StatefulWidget {
  const FlightPlanWidget({Key key}) : super(key: key);

  @override
  _FlightPlanWidgetState createState() => _FlightPlanWidgetState();
}

class _FlightPlanWidgetState extends State<FlightPlanWidget> {
  Map<AltitudeRecord, bool> checkboxListTileValueMap = {};
  List<AltitudeRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.format_line_spacing_outlined,
            color: FlutterFlowTheme.white,
            size: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      drawer: Drawer(
        elevation: 16,
        child: SideBarWidget(),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
            child: Text(
              '30 Day',
              style: FlutterFlowTheme.title1,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
            child: StreamBuilder<List<AltitudeRecord>>(
              stream: queryAltitudeRecord(
                queryBuilder: (altitudeRecord) =>
                    altitudeRecord.where('tagOne', isEqualTo: 'Flight Plan'),
              ),
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
                List<AltitudeRecord> listViewAltitudeRecordList = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAltitudeRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewAltitudeRecord =
                        listViewAltitudeRecordList[listViewIndex];
                    return CheckboxListTile(
                      value:
                          checkboxListTileValueMap[listViewAltitudeRecord] ??=
                              false,
                      onChanged: (newValue) => setState(() =>
                          checkboxListTileValueMap[listViewAltitudeRecord] =
                              newValue),
                      title: Text(
                        listViewAltitudeRecord.title,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Mulish',
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        listViewAltitudeRecord.tagTwo,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Mulish',
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
