import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 80,
        left: MediaQuery.of(context).size.width * 0.38,
        child: Container(
          height: 80,
          width: 80,
          // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     color: Colors.black26,
          //   )
          // ]),
          child: Align(
            alignment: Alignment.topRight,
            child: Image(
              image: AssetImage('assets/citi_azul.png'),
              height: 95.0,
              width: 95.0,
            ),
          ),
        ));
  }
}
