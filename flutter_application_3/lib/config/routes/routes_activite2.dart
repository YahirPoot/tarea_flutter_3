import 'package:flutter_application_3/presentation/screens/navigation/firstActivite/main_screens.dart';
import 'package:flutter_application_3/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(
        title: '',
      ),
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/navigation_buttom',
      builder: (context, state) => const FirstRouter(),
    ),
    GoRoute(
      path: '/navigation_name',
      builder: (context, state) => const ClassMain(),
    ),
    GoRoute(
      path: '/name_route',
      builder: (context, state) => const NameRoute(),
    ),
    GoRoute(
      path: '/return_data',
      builder: (context, state) => const HomeScreen2(),
    ),
    GoRoute(
      path: '/todos_activite',
      builder: (context, state) => const MainTodosScreen(),
    ),
    GoRoute(
      path: '/album_1',
      builder: (context, state) => const AlbumActivite(),
    ),
    GoRoute(
      path: '/album_2',
      builder: (context, state) => const AlbumActivite2(),
    ),
    GoRoute(
      path: '/send_data',
      builder: (context, state) => const SendDataToInternet(),
    ),
    GoRoute(
      path: '/update_data',
      builder: (context, state) => const UpdateDataOverInternet(),
    ),
    //!Actividad Networking
    GoRoute(
      path: '/delete_data',
      builder: (context, state) => const DeleteDataInternet(),
    ),
    GoRoute(
      path: '/communicate_websocket',
      builder: (context, state) => const ActiviteSix(),
    ),
    GoRoute(
      path: '/parse_json',
      builder: (context, state) => const ParseJsonInTheBackground(),
    ),
    GoRoute(
      path: '/slq_activite',
      builder: (context, state) => const SqlLitePage(),
    ),
    GoRoute(
      path: '/read_files',
      builder: (context, state) => const ReadAndWriteFiles(),
    ),
    GoRoute(
      path: '/store_data',
      builder: (context, state) => const StoreKeyData()
    ),
  ],
);


