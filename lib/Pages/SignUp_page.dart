import 'package:flutter/material.dart';
import 'package:firmaservicios/Widgets/Header.dart';
import 'package:firmaservicios/Widgets/LogoHeader.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [HeaderSignUp(), LogoHeader()],
          ),
          _Titulo(),
          SizedBox(
            height: 40,
          ),
          _TextField(),
          SizedBox(
            height: 40,
          ),
          _BotonSignUp()
        ],
      ),
    );
  }
}

class _BotonSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        //color: Color(0xff5511b0),
        color: Color.fromRGBO(5, 109, 174, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: FlatButton(
        child: Text('INGRESAR',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {},
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  TextEditingController emailcontroller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: emailcontroller,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: InputDecoration(
                hintText: "Correo electrónico",
                filled: true,
                //fillColor: Color(0xffEBDCfA),
                fillColor: Color.fromRGBO(54, 105, 194, .2),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.blue[900],
                ),
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xffEBDCfA)),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(54, 105, 194, .5)),
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffEBDCfA)),
                  // borderSide: BorderSide(color: Color.fromRGBO(54, 105, 194, .5)),
                  borderRadius: BorderRadius.circular(50),
                )),
          ),
        ],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'login'),
            child: Text(
              'INGRESAR',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'signup'),
            child: Text(
              'Olvidé password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
