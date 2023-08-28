import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stag_shopping/src/authentication/domain/repositories/storage_service.dart';

import '../../firebase_options.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
  }
}
