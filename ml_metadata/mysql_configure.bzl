# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Pulls mariadb-connector-c github repo and builds it.

Clients can then depend on `@libmysqlclient` to use the MYSQL C API.
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def mysql_configure():
    new_git_repository(
        name = "libmysqlclient",
        build_file = "//ml_metadata:libmysqlclient.BUILD",
        workspace_file = "//ml_metadata:libmysqlclient.WORKSPACE",
        remote = "https://github.com/MariaDB/mariadb-connector-c.git",
        tag = "v3.0.8-release",
        patches = ["//ml_metadata/third_party:libmysqlclient.patch"],
    )
