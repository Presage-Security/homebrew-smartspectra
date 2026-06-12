# SPDX-License-Identifier: LicenseRef-Proprietary

class SmartspectraRc < Formula
  desc "SmartSpectra C++ SDK release candidate"
  homepage "https://physiology.presagetech.com"
  url "https://github.com/Presage-Security/homebrew-smartspectra/releases/download/smartspectra-v3.2.0-rc.5/smartspectra-sdk-3.2.0-rc.5-macos-arm64.tar.gz"
  sha256 "3be05f7403a7c7b76442edea87aef3898d2841cce1848fb0dd365c945fad8e73"
  version "3.2.0-rc.5"
  license "LicenseRef-Proprietary"
  conflicts_with "smartspectra", because: "both install SmartSpectra headers, libraries, and CMake package files"

  depends_on macos: :sonoma
  depends_on "opencv"
  depends_on "vulkan-loader"
  depends_on "molten-vk"
  depends_on "cmake" => :build

  livecheck do
    url :stable
    regex(/smartspectra-v?([0-9]+(?:\.[0-9]+){2}-(?:alpha|beta|rc|pre)\.?[0-9]*)/i)
  end

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      This is the SmartSpectra release-candidate channel.

      When a stable release catches up to this prerelease, switch back to the
      stable formula:

        brew uninstall smartspectra-rc
        brew install smartspectra
    EOS
  end

  test do
    assert_predicate lib/"cmake/SmartSpectra/SmartSpectraConfig.cmake", :exist?
    assert_predicate include/"smartspectra/version.hpp", :exist?
    assert_predicate include/"smartspectra/interface/google/protobuf/message.h", :exist?
    refute_predicate include/"google/protobuf/message.h", :exist?
    assert_predicate share/"doc/smartspectra/LICENSE", :exist?
  end
end
