import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../s_m_s_confirm/s_m_s_confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneSignInWidget extends StatefulWidget {
  const PhoneSignInWidget({Key key}) : super(key: key);

  @override
  _PhoneSignInWidgetState createState() => _PhoneSignInWidgetState();
}

class _PhoneSignInWidgetState extends State<PhoneSignInWidget> {
  TextEditingController phoneNumberController;
  bool phoneNumberVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController(text: '+81');
    phoneNumberVisibility = false;
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
                  child: LoginWidget(),
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
                'Phone Sign In',
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
                  controller: phoneNumberController,
                  obscureText: !phoneNumberVisibility,
                  decoration: InputDecoration(
                    labelText: 'Your Phone Number',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Mulish',
                      color: Color(0x98FFFFFF),
                    ),
                    hintText: 'Please include your country code (+81)',
                    hintStyle: FlutterFlowTheme.bodyText1.override(
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
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => phoneNumberVisibility = !phoneNumberVisibility,
                      ),
                      child: Icon(
                        phoneNumberVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: FlutterFlowTheme.white,
                        size: 22,
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Mulish',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
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
                    if (phoneNumberController.text.isEmpty ||
                        !phoneNumberController.text.startsWith('+')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Phone Number is required and has to start with +.'),
                        ),
                      );
                      return;
                    }
                    await beginPhoneAuth(
                      context: context,
                      phoneNumber: phoneNumberController.text,
                      onCodeSent: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: SMSConfirmWidget(),
                          ),
                          (r) => false,
                        );
                      },
                    );
                  },
                  text: 'Sign In with Phone',
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
