import 'package:flutter/material.dart';
import 'package:sca_mentee/model/photo_model.dart';
import 'package:sca_mentee/services/web_services.dart';
import 'package:sca_mentee/viewmodel/homescreen_viewmodel.dart';

import 'package:stacked/stacked.dart';

class HomeScren extends StatefulWidget {
  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  ApiUrl apiUrl = ApiUrl();
  Photo photo;

  @override
  Widget build(BuildContext context) {
    apiUrl.randomPhoto();
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        onModelReady: (model) => model.loadPhoto(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: model.isBusy
                    ? CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 34,
                                      spreadRadius: -5),
                                ],
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(model.imageLink),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
        viewModelBuilder: () => HomeScreenViewModel());
  }
}
