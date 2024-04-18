import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyInitial());

  Future<void> fuckingShit() async {
    final dio = Dio();
    print('------------------------------------------------------------------------------------------------------------');

    final govno = await dio.post('https://hcateringback-dev.unitbeandev.com/api/auth/login',
      options: Options(headers: {
      }),
    data: jsonEncode({
      'login':'admin',
      'password':'admin',
    }),
    );
    final accessToken = (govno.data as Map<String, dynamic>)['access_token'];
    print((govno.data as Map<String, dynamic>)['access_token']);
    print('------------------------------------------------------------------------------------------------------------');

    final response = await dio.get('https://hcateringback-dev.unitbeandev.com/api/wh/items?page=1&pageSize=10',
      options: Options(headers: {
        'Authorization': accessToken,
      }),
    );
    print(response);
  }
}
