import '../backend/backend.dart';
import '../components/bs_menu_widget.dart';
import '../components/side_bar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: InkWell(
            onTap: () async {
              scaffoldKey.currentState.openDrawer();
            },
            child: Icon(
              Icons.home_filled,
              color: FlutterFlowTheme.white,
              size: 24,
            ),
          ),
        ),
        title: Text(
          'Altitude',
          style: FlutterFlowTheme.title3,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Icon(
              Icons.person_outline,
              color: FlutterFlowTheme.white,
              size: 24,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.mountainMeadow,
        elevation: 8,
        child: Align(
          alignment: AlignmentDirectional(0, 0),
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
              FontAwesomeIcons.brain,
              color: FlutterFlowTheme.white,
              size: 24,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: SideBarWidget(),
      ),
      body: Stack(
        children: [
          StreamBuilder<List<AltitudeRecord>>(
            stream: queryAltitudeRecord(
              limit: 30,
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
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                valueOrDefault<String>(
                                  listViewAltitudeRecord.image,
                                  'https://lh3.googleusercontent.com/pw/AM-JKLUuc03s88JNJmBaozLAjUj4jzRHrjZPeQ4M6bhR2hhKJh9Wc-KyxgBjJwJE66hayFDBjVR_OCoUnmNzgXsOAwJNvbQde0G8m_uzdzh7onHjLqQLdY657KS1oJLQnkwmgqP0i-G5QIJm4Xnu8pbirYNK=s1000-no?authuser=0',
                                ),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x00222643),
                                    Color(0x4C222643)
                                  ],
                                  stops: [0.6, 1],
                                  begin: AlignmentDirectional(0, -1),
                                  end: AlignmentDirectional(0, 1),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0.7),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 10, 15, 10),
                                child: Text(
                                  listViewAltitudeRecord.title
                                      .maybeHandleOverflow(maxChars: 80),
                                  style: FlutterFlowTheme.title3,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, -1),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.9, -0.85),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: 100,
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: AutoSizeText(
                                          listViewAltitudeRecord.tagOne,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Mulish',
                                            color: FlutterFlowTheme.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
