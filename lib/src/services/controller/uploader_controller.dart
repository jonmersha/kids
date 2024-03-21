import 'package:get/get.dart';
import 'package:kids/src/services/model/uploader.dart';
import 'package:kids/src/services/model/video_group.dart';
import 'package:kids/src/services/repository/repo_service.dart';

class UploaderController extends GetxController {
  final Services serviceRepo;
  UploaderController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
    print(response.body);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(Uploader.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
