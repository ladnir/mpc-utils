load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@com_github_schoppmp_rules_oblivc//oblivc:deps.bzl", "oblivc_deps")
load(
    "@rules_foreign_cc//:workspace_definitions.bzl",
    "rules_foreign_cc_dependencies",
)

all_content = """
filegroup(
  name = "all",
  srcs = glob(["**"]),
  visibility = ["//visibility:public"],
)
"""

def mpc_utils_deps():
    # Initialize transitive dependencies.
    boost_deps()
    rules_foreign_cc_dependencies()
    oblivc_deps()

    if "org_gmplib" not in native.existing_rules():
        http_archive(
            name = "org_gmplib",
            url = "https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz",
            strip_prefix = "gmp-6.1.2",
            build_file_content = all_content,
            sha256 = "87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912",
        )

    if "net_shoup_ntl" not in native.existing_rules():
        http_archive(
            name = "net_shoup_ntl",
            url = "https://shoup.net/ntl/ntl-11.3.2.tar.gz",
            sha256 = "84ba3145abf8d5f3be6832a14c60b3368eb920719ee96e5774587e71ecd66e9d",
            strip_prefix = "ntl-11.3.2",
            patches = [
                # Adds a custom configure script to ensure compatibility with rules_foreign_cc.
                "@mpc_utils//third_party/ntl:configure-script.patch",
            ],
            build_file_content = all_content,
        )

    if "googletest" not in native.existing_rules():
        http_archive(
            name = "googletest",
            url = "https://github.com/abseil/googletest/archive/6cbd3753dc195595689a0fbb99e7297128a2ed26.zip",
            sha256 = "61598b28fda40dbe0cc0294a61fe0878d4045fa9afe6bdbaf4b3e4f6e1d9a31e",
            strip_prefix = "googletest-6cbd3753dc195595689a0fbb99e7297128a2ed26",
        )

    if "com_github_xianyi_openblas" not in native.existing_rules():
        http_archive(
            name = "com_github_xianyi_openblas",
            build_file_content = all_content,
            strip_prefix = "OpenBLAS-0.3.4",
            urls = ["https://github.com/xianyi/OpenBLAS/archive/v0.3.4.tar.gz"],
            sha256 = "4b4b4453251e9edb5f57465bf2b3cf67b19d811d50c8588cdf2ea1f201bb834f",
        )

    if "org_bitbucket_eigen" not in native.existing_rules():
        http_archive(
            name = "org_bitbucket_eigen",
            build_file_content = all_content,
            strip_prefix = "eigen-eigen-323c052e1731",
            urls = ["https://bitbucket.org/eigen/eigen/get/3.3.7.tar.gz"],
            sha256 = "7e84ef87a07702b54ab3306e77cea474f56a40afa1c0ab245bb11725d006d0da",
        )

    if "abseil" not in native.existing_rules():
        http_archive(
            name = "abseil",
            url = "https://github.com/abseil/abseil-cpp/archive/018b4db1d73ec8238e6dc4b17fd9e1fd7468d0ed.zip",
            strip_prefix = "abseil-cpp-018b4db1d73ec8238e6dc4b17fd9e1fd7468d0ed",
            sha256 = "da6e451773c2f33755dce4792e89ef5983576ce20026579947961140d907fccd",
        )