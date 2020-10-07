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
  Photos photo;

  @override
  Widget build(BuildContext context) {
    apiUrl.randomPhoto();
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Container(
                  width: 100,
                  height: 100,
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
                      image: NetworkImage(photo?.src?.large),
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => HomeScreenViewModel());
  }
}
