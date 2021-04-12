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

class MLBankcard {
  String expire;
  String number;
  String type;
  String organization;
  String issuer;
  String originalBitmap;
  String numberBitmap;
  int errorCode;

  MLBankcard(
      {this.expire,
      this.number,
      this.numberBitmap,
      this.originalBitmap,
      this.errorCode,
      this.type,
      this.issuer,
      this.organization});

  factory MLBankcard.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return MLBankcard(
        expire: json['expire'] ?? null,
        number: json['number'] ?? null,
        errorCode: json['errorCode'] ?? null,
        originalBitmap: json['originalBitmap'] ?? null,
        numberBitmap: json['numberBitmap'] ?? null,
        type: json['type'] ?? null,
        issuer: json['issuer'] ?? null,
        organization: json['organization'] ?? null);
  }
}
