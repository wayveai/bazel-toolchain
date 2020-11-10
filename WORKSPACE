# Copyright 2018 The Bazel Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

workspace(
    name = "com_grail_bazel_toolchain",
)

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "8.0.0",
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

## Toolchain example with a sysroot.
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# This sysroot is used by github.com/vsco/bazel-toolchains.
http_archive(
    name = "org_chromium_sysroot_linux_x64",
    build_file_content = """
filegroup(
  name = "sysroot",
  srcs = glob(["*/**"]),
  visibility = ["//visibility:public"],
)
""",
    sha256 = "84656a6df544ecef62169cfe3ab6e41bb4346a62d3ba2a045dc5a0a2ecea94a3",
    urls = ["https://commondatastorage.googleapis.com/chrome-linux-sysroot/toolchain/2202c161310ffde63729f29d27fe7bb24a0bc540/debian_stretch_amd64_sysroot.tar.xz"],
)

http_archive(
    name = "org_chromium_sysroot_linux_arm",
    build_file_content = """
filegroup(
  name = "sysroot",
  srcs = glob(["*/**"]),
  visibility = ["//visibility:public"],
)
""",
    sha256 = "39d04a95b5f689ab443e58f7e2afc10dca5f61bca572ba926f80b74b23db12a4",
    urls = ["https://commondatastorage.googleapis.com/chrome-linux-sysroot/toolchain/fAF64dEF2e32577c0572DFCb04C5eEE2/ubuntu_trusty_arm64_sysroot.tgz"],
)

llvm_toolchain(
    name = "llvm_toolchain_linux_sysroot",
    llvm_version = "9.0.0",
    sysroot = {
        "linux": "@org_chromium_sysroot_linux_x64//:sysroot",
        "darwin": "@org_chromium_sysroot_linux_x64//:sysroot",
        "aarch64": "@org_chromium_sysroot_linux_arm//:sysroot",
    },
)

load("@com_grail_bazel_toolchain//toolchain:repositories.bzl", "bazel_toolchains_repositories")
bazel_toolchains_repositories("9.0.0")
