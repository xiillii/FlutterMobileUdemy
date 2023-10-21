import 'package:image_picker/image_picker.dart';
import 'package:teslo_app/features/shared/infrastructure/services/camera_gallery_service.dart';

class CameraGalleryServiceImpl implements CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> selectPhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (photo == null) return null;

    print('Photo: ${photo.path}');

    return photo.path;
  }

  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (photo == null) return null;

    print('Photo: ${photo.path}');

    return photo.path;
  }
}
