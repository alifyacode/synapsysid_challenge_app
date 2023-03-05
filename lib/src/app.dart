import 'package:flutter/material.dart';
import 'package:synapsysid_challenge_app/src/core/application_binding/application_binding.dart';
import 'package:synapsysid_challenge_app/src/feature/AppDevDetails/app_dev_detail_page.dart';
import 'package:synapsysid_challenge_app/src/feature/Auth/auth_page.dart';
import 'package:synapsysid_challenge_app/src/feature/DeviceInfo/gps_coordinate_page.dart';
import 'package:synapsysid_challenge_app/src/feature/DeviceInfo/sensor_page.dart';
import 'package:synapsysid_challenge_app/src/feature/Register/register_page.dart';
import 'package:synapsysid_challenge_app/src/feature/home/home_page.dart';
import 'core/ui/theme/theme_config.dart';
import 'feature/DeviceInfo/battery_level_page.dart';
import 'feature/DeviceInfo/device_info_page.dart';
import 'feature/GPSMap/gps_map_page.dart';
import 'feature/TimestampCamera/timestamp_camera_page.dart';
import 'feature/UserProfile/user_profile_page.dart';
import 'feature/home/home_controller.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Synapsys Id Challenge',
        initialRoute: '/',
        routes: {
          '/':(context) => HomePage(),
          '/auth':(context) => AuthPage(),
          '/register':(context) => RegisterPage(),
          '/deviceinfo':(context) => DeviceInfoPage(),
          '/sensorstate':(context) => SensorPage(),
          '/gpscoordinate':(context) => GpsCoordinatePage(),
          '/gpsmap':(context) => GpsMapPage(),
          '/batterylevel':(context) => BatteryLevelPage(),
          '/timestampcamera':(context) => TimestampCameraPage(),
          '/appdevdetail':(context) => AppDevDetailPage(),
          '/userprofile':(context) => UserProfilePage(user: (HomeController.userLogged)),

        },
        theme: ThemeConfig.theme
      ),
    );
  }
}