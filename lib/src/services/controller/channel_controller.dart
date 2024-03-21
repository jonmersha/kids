import 'package:get/get.dart';
import 'package:kids/src/services/model/channel.dart';
import 'package:kids/src/services/model/video_group.dart';
import 'package:kids/src/services/repository/repo_service.dart';

class ChannelController extends GetxController {
  final Services serviceRepo;
  ChannelController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
    print(response.body);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(Channel.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
