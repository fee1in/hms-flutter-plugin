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
import 'package:flutter/foundation.dart' show required;
import 'package:huawei_map/constants/param.dart';

class UrlTile {
  String uri;

  UrlTile({@required this.uri});

  Map<String, dynamic> toJson() => {
        Param.uri: uri,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final UrlTile check = other;
    return uri == check.uri;
  }

  @override
  int get hashCode => uri.hashCode;
}
