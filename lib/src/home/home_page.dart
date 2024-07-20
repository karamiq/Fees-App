import 'dart:io';
import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_svg_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraState {
  final bool isInitialized;
  final CameraController? cameraController;

  CameraState({required this.isInitialized, this.cameraController});
}

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier()
      : super(CameraState(isInitialized: false, cameraController: null));

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw Exception('No cameras available');
      }
      final controller = CameraController(cameras.first, ResolutionPreset.high);
      await controller.initialize();
      state = CameraState(isInitialized: true, cameraController: controller);
    } catch (e) {}
  }

  void disposeCamera() {
    state.cameraController?.dispose();
    state = CameraState(isInitialized: false, cameraController: null);
  }
}

final cameraNotifierProvider =
    StateNotifierProvider<CameraNotifier, CameraState>(
        (ref) => CameraNotifier());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(cameraNotifierProvider.notifier).initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraNotifierProvider);

    if (!cameraState.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          if (cameraState.cameraController != null)
            Positioned.fill(
              child: CameraPreview(cameraState.cameraController!),
            ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: takePicture,
              child: Icon(Icons.camera),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              child: SvgPicture.asset(
                Assets.assetsSvgProfile,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> takePicture() async {
    try {
      final cameraController =
          ref.read(cameraNotifierProvider.notifier).state.cameraController;
      if (cameraController != null) {
        final picture = await cameraController.takePicture();
        final path = picture.path;

        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(),
                  Text('Captured Photo'),
                  const SizedBox(height: 16),
                  Image.file(File(path)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the modal
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
        );
      }
    } catch (e) {
      print('Error capturing picture: $e');
    }
  }

  @override
  void dispose() {
    ref.read(cameraNotifierProvider.notifier).disposeCamera();
    super.dispose();
  }
}
