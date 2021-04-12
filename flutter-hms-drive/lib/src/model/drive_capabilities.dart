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

class DriveCapabilities {
  bool addChildNodePermission;
  bool writerHasCopyPermission;
  bool commentPermission;
  bool copyPermission;
  bool deletePermission;
  bool deleteChildNodePermission;
  bool downloadPermission;
  bool editPermission;
  bool listChildNodePermission;
  bool readHistoryVersionPermission;
  bool removeChildNodePermission;
  bool renameFilePermission;
  bool shareFilePermission;
  bool recyclePermission;
  bool recycleChildNodePermission;
  bool unrecyclePermission;

  DriveCapabilities({
    this.addChildNodePermission,
    this.writerHasCopyPermission,
    this.commentPermission,
    this.copyPermission,
    this.deletePermission,
    this.deleteChildNodePermission,
    this.downloadPermission,
    this.editPermission,
    this.listChildNodePermission,
    this.readHistoryVersionPermission,
    this.removeChildNodePermission,
    this.renameFilePermission,
    this.shareFilePermission,
    this.recyclePermission,
    this.recycleChildNodePermission,
    this.unrecyclePermission,
  });

  DriveCapabilities clone({
    bool addChildNodePermission,
    bool writerHasCopyPermission,
    bool commentPermission,
    bool copyPermission,
    bool deletePermission,
    bool deleteChildNodePermission,
    bool downloadPermission,
    bool editPermission,
    bool listChildNodePermission,
    bool readHistoryVersionPermission,
    bool removeChildNodePermission,
    bool renameFilePermission,
    bool shareFilePermission,
    bool recyclePermission,
    bool recycleChildNodePermission,
    bool unrecyclePermission,
  }) {
    return DriveCapabilities(
      addChildNodePermission:
          addChildNodePermission ?? this.addChildNodePermission,
      writerHasCopyPermission:
          writerHasCopyPermission ?? this.writerHasCopyPermission,
      commentPermission: commentPermission ?? this.commentPermission,
      copyPermission: copyPermission ?? this.copyPermission,
      deletePermission: deletePermission ?? this.deletePermission,
      deleteChildNodePermission:
          deleteChildNodePermission ?? this.deleteChildNodePermission,
      downloadPermission: downloadPermission ?? this.downloadPermission,
      editPermission: editPermission ?? this.editPermission,
      listChildNodePermission:
          listChildNodePermission ?? this.listChildNodePermission,
      readHistoryVersionPermission:
          readHistoryVersionPermission ?? this.readHistoryVersionPermission,
      removeChildNodePermission:
          removeChildNodePermission ?? this.removeChildNodePermission,
      renameFilePermission: renameFilePermission ?? this.renameFilePermission,
      shareFilePermission: shareFilePermission ?? this.shareFilePermission,
      recyclePermission: recyclePermission ?? this.recyclePermission,
      recycleChildNodePermission:
          recycleChildNodePermission ?? this.recycleChildNodePermission,
      unrecyclePermission: unrecyclePermission ?? this.unrecyclePermission,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addChildNodePermission': addChildNodePermission,
      'writerHasCopyPermission': writerHasCopyPermission,
      'commentPermission': commentPermission,
      'copyPermission': copyPermission,
      'deletePermission': deletePermission,
      'deleteChildNodePermission': deleteChildNodePermission,
      'downloadPermission': downloadPermission,
      'editPermission': editPermission,
      'listChildNodePermission': listChildNodePermission,
      'readHistoryVersionPermission': readHistoryVersionPermission,
      'removeChildNodePermission': removeChildNodePermission,
      'renameFilePermission': renameFilePermission,
      'shareFilePermission': shareFilePermission,
      'recyclePermission': recyclePermission,
      'recycleChildNodePermission': recycleChildNodePermission,
      'unrecyclePermission': unrecyclePermission,
    };
  }

  factory DriveCapabilities.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DriveCapabilities(
      addChildNodePermission: map['addChildNodePermission'],
      writerHasCopyPermission: map['writerHasCopyPermission'],
      commentPermission: map['commentPermission'],
      copyPermission: map['copyPermission'],
      deletePermission: map['deletePermission'],
      deleteChildNodePermission: map['deleteChildNodePermission'],
      downloadPermission: map['downloadPermission'],
      editPermission: map['editPermission'],
      listChildNodePermission: map['listChildNodePermission'],
      readHistoryVersionPermission: map['readHistoryVersionPermission'],
      removeChildNodePermission: map['removeChildNodePermission'],
      renameFilePermission: map['renameFilePermission'],
      shareFilePermission: map['shareFilePermission'],
      recyclePermission: map['recyclePermission'],
      recycleChildNodePermission: map['recycleChildNodePermission'],
      unrecyclePermission: map['unrecyclePermission'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DriveCapabilities.fromJson(String source) =>
      DriveCapabilities.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Capabilities(addChildNodePermission: $addChildNodePermission, writerHasCopyPermission: $writerHasCopyPermission, commentPermission: $commentPermission, copyPermission: $copyPermission, deletePermission: $deletePermission, deleteChildNodePermission: $deleteChildNodePermission, downloadPermission: $downloadPermission, editPermission: $editPermission, listChildNodePermission: $listChildNodePermission, readHistoryVersionPermission: $readHistoryVersionPermission, removeChildNodePermission: $removeChildNodePermission, renameFilePermission: $renameFilePermission, shareFilePermission: $shareFilePermission, recyclePermission: $recyclePermission, recycleChildNodePermission: $recycleChildNodePermission, unrecyclePermission: $unrecyclePermission)';
  }
}
