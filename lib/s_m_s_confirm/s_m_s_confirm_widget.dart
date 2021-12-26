import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import '../phone_sign_in/phone_sign_in_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SMSConfirmWidget extends StatefulWidget {
  const SMSConfirmWidget({Key key}) : super(key: key);

  @override
  _SMSConfirmWidgetState createState() => _SMSConfirmWidgetState();
}

class _SMSConfirmWidgetState extends State<SMSConfirmWidget> {
  TextEditingController sMSNumberController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    sMSNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 300),
                  reverseDuration: Duration(milliseconds: 300),
                  child: PhoneSignInWidget(),
                ),
              );
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.tertiaryColor,
              size: 32,
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
              child: Text(
                'Code Verification',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: FlutterFlowTheme.primaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.primaryColor,
                FlutterFlowTheme.secondaryColor
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'sMSNumberController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: sMSNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Enter the 6 Digit Code',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Mulish',
                      color: Color(0x98FFFFFF),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    suffixIcon: sMSNumberController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => sMSNumberController.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.white,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Mulish',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please enter your phone number.';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (!formKey.currentState.validate()) {
                      return;
                    }
                    if (sMSNumberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enter SMS verification code.'),
                        ),
                      );
                      return;
                    }
                    final phoneVerifiedUser = await verifySmsCode(
                      context: context,
                      smsCode: sMSNumberController.text,
                    );
                    if (phoneVerifiedUser == null) {
                      return;
                    }
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: HomeWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Verify Code',
                  icon: Icon(
                    Icons.chevron_right_sharp,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 230,
                    height: 60,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Mulish',
                      color: FlutterFlowTheme.white,
                    ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Color(0x00222643),
                      width: 0,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
