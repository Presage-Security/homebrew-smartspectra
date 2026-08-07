# SPDX-License-Identifier: LicenseRef-Proprietary

class Smartspectra < Formula
  desc "SmartSpectra C++ SDK"
  homepage "https://physiology.presagetech.com"
  url "https://github.com/Presage-Security/homebrew-smartspectra/releases/download/smartspectra-v3.3.0/smartspectra-sdk-3.3.0-macos-arm64.tar.gz"
  sha256 "9f153786f6276135e83a537b76b06388c84a52bebbd628370365547b9c2a2fcc"
  version "3.3.0"
  license "LicenseRef-Proprietary"
  conflicts_with "smartspectra-rc", because: "both install SmartSpectra headers, libraries, and CMake package files"

  depends_on macos: :sonoma
  depends_on "cmake" => :build

  livecheck do
    url :stable
    regex(/smartspectra-v?([0-9]+(?:\.[0-9]+){2})(?![-.0-9A-Za-z])/i)
  end

  def install
    prefix.install Dir["*"]
  end

  

  test do
    assert_predicate lib/"cmake/SmartSpectra/SmartSpectraConfig.cmake", :exist?
    assert_predicate include/"smartspectra/version.hpp", :exist?
    assert_predicate include/"smartspectra/interface/google/protobuf/message.h", :exist?
    refute_predicate include/"google/protobuf/message.h", :exist?
    assert_predicate share/"doc/smartspectra/LICENSE", :exist?
  end
end
