import 'package:get/get.dart';
import 'package:kids/src/services/model/vodeo.dart';
import 'package:kids/src/services/repository/repo_service.dart';

class VideoController extends GetxController {
  final Services serviceRepo;
  VideoController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
//print(response.body);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(Video.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
