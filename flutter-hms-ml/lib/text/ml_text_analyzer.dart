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

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:huawei_ml/models/ml_text.dart';
import 'package:huawei_ml/text/ml_text_analyzer_setting.dart';
import 'package:huawei_ml/utils/channels.dart';

class MLTextAnalyzer {
  final MethodChannel _channel = Channels.textAnalyzerMethodChannel;

  Future<MLText> asyncAnalyzeFrame(MLTextAnalyzerSetting setting) async {
    return new MLText.fromJson(json.decode(
        await _channel.invokeMethod('asyncTextAnalyze', setting.toMap())));
  }

  Future<List<Blocks>> analyzeFrame(MLTextAnalyzerSetting setting) async {
    var res = json.decode(
        await _channel.invokeMethod("syncTextAnalyze", setting.toMap()));
    return (res as List).map((e) => Blocks.fromJson(e)).toList();
  }

  Future<int> getAnalyzeType() async {
    return await _channel.invokeMethod("getAnalyzeType");
  }

  Future<bool> isTextAnalyzerAvailable() async {
    return await _channel.invokeMethod("isAvailable");
  }

  Future<bool> stopTextAnalyzer() async {
    return await _channel.invokeMethod("stopTextAnalyzer");
  }
}
