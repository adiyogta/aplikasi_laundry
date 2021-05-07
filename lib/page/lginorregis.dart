import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginOrRegis extends StatefulWidget {
  @override
  _LoginOrRegisState createState() => _LoginOrRegisState();
}

class _LoginOrRegisState extends State<LoginOrRegis> {
  //
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  String _message = "Not Authorized";

  String finger;

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    print(canCheckBiometrics);
    finger = canCheckBiometrics.toString();
    return canCheckBiometrics;
  }

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing",
        useErrorDialogs: true,
        stickyAuth: true,
      );
      setState(() {
        _message = authenticated ? "Authorized" : "Not Authorized";
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  void initState() {
    // TODO: implement initState
    checkingForBioMetrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var styleText = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(25, 119, 155, 1),
              Color.fromRGBO(11, 187, 167, 1),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Rumah Loundry',
            style: styleText.headline5,
          ),
          Icon(
            Icons.water_damage_outlined,
            size: size.width * 0.42,
            color: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              FlatButton(
                height: 30,
                minWidth: size.width * 0.43,
                shape: StadiumBorder(),
                color: Colors.white,
                onPressed: () {},
                child: Text('Login', style: styleText.headline4),
              ),
              FlatButton(
                height: 30,
                minWidth: size.width * 0.43,
                shape: StadiumBorder(),
                color: Colors.white,
                onPressed: () {},
                child: Text('Register Now', style: styleText.headline3),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Text('Now! Quick Login Use Touch ID', style: styleText.subtitle1),
          SizedBox(
            height: size.height * 0.03,
          ),
          Icon(
            Icons.fingerprint,
            size: size.width * 0.22,
            color: Colors.white,
          ),
          (finger != null)
              ? Text(
                  "$_message",
                  style: styleText.headline5,
                )
              : SizedBox(),
          TextButton(
            onPressed: _authenticateMe,
            focusNode: FocusNode(descendantsAreFocusable: true),
            child: Text('Use Touch ID', style: styleText.headline5),
          ),
        ],
      ),
    );
  }
}
