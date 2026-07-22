# SPDX-License-Identifier: LicenseRef-Proprietary

class SmartspectraRc < Formula
  desc "SmartSpectra C++ SDK release candidate"
  homepage "https://physiology.presagetech.com"
  url "https://github.com/Presage-Security/homebrew-smartspectra/releases/download/smartspectra-v3.3.0-rc.4/smartspectra-sdk-3.3.0-rc.4-macos-arm64.tar.gz"
  sha256 "28437cb4a929ed330bacebcd0a8679868b117f0af5422956aa1234d12a1e743f"
  version "3.3.0-rc.4"
  license "LicenseRef-Proprietary"
  conflicts_with "smartspectra", because: "both install SmartSpectra headers, libraries, and CMake package files"

  depends_on macos: :sonoma
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
