# SPDX-License-Identifier: LicenseRef-Proprietary

class Smartspectra < Formula
  desc "SmartSpectra C++ SDK"
  homepage "https://physiology.presagetech.com"
  url "https://github.com/Presage-Security/homebrew-smartspectra/releases/download/smartspectra-v3.2.1/smartspectra-sdk-3.2.1-macos-arm64.tar.gz"
  sha256 "ab42a9088d462c39f0443970de40cc46671c148af95b467c96625564751686f1"
  version "3.2.1"
  license "LicenseRef-Proprietary"
  conflicts_with "smartspectra-rc", because: "both install SmartSpectra headers, libraries, and CMake package files"

  depends_on macos: :sonoma
  depends_on "opencv"
  # MoltenVK (Vulkan inference backend) is statically linked into
  # libsmartspectra.dylib, so vulkan-loader / molten-vk are NOT runtime deps.
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
