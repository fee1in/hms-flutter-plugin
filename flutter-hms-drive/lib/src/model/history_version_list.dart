/*
    Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

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

import 'history_version.dart';

/// History version list class, which used for reading the list of historical file
/// versions by pagination.
class HistoryVersionList {
  /// Resource type.
  ///
  /// The value is always `drive#historyVersionList`.
  String category;

  ///	Next page cursor for query.
  ///
  /// If nextCursor is empty, there is no next page.
  String nextCursor;

  /// List of historical file versions.
  List<HistoryVersion> historyVersions;

  HistoryVersionList({
    this.category,
    this.nextCursor,
    this.historyVersions,
  });

  HistoryVersionList clone({
    String category,
    String nextCursor,
    List<HistoryVersion> historyVersion,
  }) {
    return HistoryVersionList(
      category: category ?? this.category,
      nextCursor: nextCursor ?? this.nextCursor,
      historyVersions: historyVersion ?? this.historyVersions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'nextCursor': nextCursor,
      'historyVersions': historyVersions?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory HistoryVersionList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HistoryVersionList instance = HistoryVersionList(
      category: map['category'],
      nextCursor: map['nextCursor'],
    );
    if (map['historyVersions'] != null) {
      if (List.from(map['historyVersions']).isNotEmpty)
        instance.historyVersions = List<HistoryVersion>.from(
            map['historyVersions']?.map((x) => HistoryVersion.fromMap(x)));
    }
    return instance;
  }

  String toJson() => json.encode(toMap());

  factory HistoryVersionList.fromJson(String source) =>
      HistoryVersionList.fromMap(json.decode(source));

  @override
  String toString() =>
      'HistoryVersionList(category: $category, nextCursor: $nextCursor, historyVersions: $historyVersions)';
}
