# SPDX-License-Identifier: LicenseRef-Proprietary

class Smartspectra < Formula
  desc "SmartSpectra C++ SDK"
  homepage "https://physiology.presagetech.com"
  url "https://github.com/Presage-Security/homebrew-smartspectra/releases/download/v3.0.0-rc.14/smartspectra-sdk-3.0.0-rc.14-macos-arm64.tar.gz"
  sha256 "205858fe4f1ce2f48ce6a552c9c49a7b0dea6c81738561949e2de0ff65b311d4"
  version "3.0.0-rc.14"
  license "LicenseRef-Proprietary"

  depends_on "opencv"
  depends_on "protobuf"
  depends_on "vulkan-loader"
  depends_on "molten-vk"
  depends_on "cmake" => :build

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_predicate lib/"cmake/SmartSpectra/SmartSpectraConfig.cmake", :exist?
    assert_predicate include/"smartspectra/version.hpp", :exist?
    assert_predicate share/"doc/smartspectra/LICENSE", :exist?
  end
end
