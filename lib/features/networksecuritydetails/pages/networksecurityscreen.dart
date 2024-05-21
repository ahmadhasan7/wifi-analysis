import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/network_security_controller.dart';

class NetworkSecurityScreen extends StatelessWidget {
  NetworkSecurityController Controller = Get.put(NetworkSecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Help Center',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor:
              Theme.of(context).primaryColor, // Customize app bar color
        ),
        body: Controller.isfake
            ? Center(
                child: const Text(
                    "The network you are connected to is suspicious Connect to a new network and try again later"),
              )
            : Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Controller.weekpassword
                        ? Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'The Password Used Seems Weak. Suggest a new password',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    Controller.userpassword,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 20),
                    Controller.checkifIsWpa
                        ? Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' The network you are connected to is poorly protected ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Check which device is streaming from the internet',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ));
  }
}
