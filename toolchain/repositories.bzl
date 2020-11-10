load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

_sources_by_release = {
    # TODO: add the some older releases
    "9.0.0": {
        "libcxx": {
            "url": "http://releases.llvm.org/9.0.0/libcxx-9.0.0.src.tar.xz",
            "sha": "3c4162972b5d3204ba47ac384aa456855a17b5e97422723d4758251acf1ed28c",
        },
        "libcxxabi": {
            "url":"http://releases.llvm.org/9.0.0/libcxxabi-9.0.0.src.tar.xz",
            "sha":"675041783565c906ac2f7f8b2bc5c40f14d871ecfa8ade34855aa18de95530e9",
        },
    },
    "6.0.0": {
        "libcxx": {
            "url": "http://releases.llvm.org/6.0.0/libcxx-6.0.0.src.tar.xz",
            "sha": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        },
        "libcxxabi": {
            "url":"http://releases.llvm.org/6.0.0/libcxxabi-6.0.0.src.tar.xz",
            "sha":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        },
    },
}

def bazel_toolchains_repositories(release):
    org_llvm_libcxx(release)
    org_llvm_libcxxabi(release)

def org_llvm_libcxx(release):
    http_archive(
        name = "org_llvm_libcxx",
        build_file = Label("//build_files:org_llvm_libcxx.BUILD"),
        sha256 = _sources_by_release[release]["libcxx"]["sha"],
        urls = [_sources_by_release[release]["libcxx"]["url"]],
        strip_prefix = "libcxx-{}.src".format(release),
    )

def org_llvm_libcxxabi(release):
    http_archive(
        name = "org_llvm_libcxxabi",
        build_file = Label("//build_files:org_llvm_libcxxabi.BUILD"),
        sha256 = _sources_by_release[release]["libcxxabi"]["sha"],
        urls = [_sources_by_release[release]["libcxxabi"]["url"]],
        strip_prefix = "libcxxabi-{}.src".format(release),
    )
