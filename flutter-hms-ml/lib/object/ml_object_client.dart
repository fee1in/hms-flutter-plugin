/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:huawei_ml/object/model/ml_object.dart';
import 'package:huawei_ml/object/ml_object_settings.dart';

class MlObjectClient {
  static const MethodChannel _channel = const MethodChannel("object_analyzer");

  static Future<MlObject> getObjectAnalyzerInformation(
      MlObjectSettings settings) async {
    final String response =
        await _channel.invokeMethod("analyzeObject", settings.toMap());
    Map<String, dynamic> objectResult = json.decode(response);
    final MlObject result = new MlObject.fromJson(objectResult);
    return result;
  }

  static Future<String> stopAnalyzer() async {
    return await _channel.invokeMethod("stopAnalyzer");
  }
}
