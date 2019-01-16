cc_library(
    name = "benchmarker",
    srcs = ["benchmarker.cpp"],
    hdrs = ["benchmarker.hpp"],
)

cc_test(
    name = "benchmarker_test",
    size = "small",
    srcs = ["benchmarker_test.cpp"],
    deps = [
        "benchmarker",
        "@googletest//:gtest_main",
    ],
)

cc_library(
    name = "server_info",
    srcs = ["server_info.cpp"],
    hdrs = ["server_info.hpp"],
)

cc_library(
    name = "config",
    srcs = ["config.cpp"],
    hdrs = ["config.hpp"],
    deps = [
        ":server_info",
        "@boost//:exception",
        "@boost//:program_options",
    ],
)

cc_library(
    name = "mpc_config",
    srcs = ["mpc_config.cpp"],
    hdrs = ["mpc_config.hpp"],
    deps = [
        ":config",
        ":server_info",
    ],
)

cc_library(
    name = "comm_channel",
    srcs = [
        "comm_channel.cpp",
        "party.cpp",
    ],
    hdrs = [
        "comm_channel.hpp",
        "party.hpp",
    ],
    deps = [
        ":mpc_config",
        "@abseil//absl/memory",
        "@boost//:asio",
        "@boost//:exception",
        "@boost//:iostreams",
        "@boost//:serialization",
        "@boost//:thread",
    ],
)

cc_test(
    name = "comm_channel_test",
    size = "small",
    srcs = [
        "comm_channel_test.cpp",
    ],
    deps = [
        ":comm_channel",
        ":mpc_config",
        "@abseil//absl/memory",
        "@boost//:thread",
        "@googletest//:gtest_main",
    ],
)

cc_library(
    name = "comm_channel_oblivc",
    srcs = [
        "comm_channel.cpp",
        "party.cpp",
    ],
    hdrs = [
        "comm_channel.hpp",
        "party.hpp",
    ],
    copts = [
        "-DMPC_UTILS_USE_OBLIVC",
    ],
    deps = [
        ":mpc_config",
        "@abseil//absl/memory",
        "@boost//:asio",
        "@boost//:exception",
        "@boost//:iostreams",
        "@boost//:serialization",
        "@boost//:thread",
        "@oblivc//:runtime",
    ],
)

cc_test(
    name = "comm_channel_oblivc_test",
    size = "small",
    srcs = [
        "comm_channel_oblivc_test.cpp",
    ],
    copts = [
        "-DMPC_UTILS_USE_OBLIVC",
    ],
    deps = [
        ":comm_channel_oblivc",
        ":mpc_config",
        "@abseil//absl/memory",
        "@boost//:thread",
        "@googletest//:gtest_main",
    ],
)
