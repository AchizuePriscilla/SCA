import 'package:flutter/cupertino.dart';
import 'package:sca_mentee/model/photo_model.dart';
import 'package:sca_mentee/services/web_services.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  String _imageLink;
  String get imageLink => _imageLink;

  Future loadPhoto() async {
    try {
      setBusy(true);
      _imageLink = await ApiUrl().randomPhoto();
      notifyListeners();
      setBusy(false);
    } catch (e) {}
  }
}
