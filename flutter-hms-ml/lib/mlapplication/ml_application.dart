/*
    Copyright 2020-2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_ml/mlapplication/ml_application_setting.dart';
import 'package:huawei_ml/utils/channels.dart';

class MLApplication {
  final MethodChannel _channel = Channels.mlApplicationMethodChannel;

  Future<void> setApiKey({@required String apiKey}) async {
    await _channel.invokeMethod("setApiKey", <String, dynamic>{'key': apiKey});
  }

  Future<void> setAccessToken({@required String accessToken}) async {
    await _channel.invokeMethod("setAccessToken", <String, dynamic>{'accessToken': accessToken});
  }

  Future<void> createSettings(MLApplicationSetting setting) async {
    await _channel.invokeMethod("createSetting", setting.toMap());
  }

  Future<void> enableLogger() async {
    await _channel.invokeMethod("enableLogger");
  }

  Future<void> disableLogger() async {
    await _channel.invokeMethod("disableLogger");
  }
}
