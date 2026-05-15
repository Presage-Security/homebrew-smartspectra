# SmartSpectra SDK

Homebrew tap for Presage Technologies' SmartSpectra C++ SDK — measure
vitals (pulse, breathing, relative blood pressure, and more) from a
camera.

For Android, iOS, and Linux/Windows builds, see
[Presage-Security/SmartSpectra](https://github.com/Presage-Security/SmartSpectra)
and the full documentation at
[smartspectra.presagetech.com](https://smartspectra.presagetech.com/).

## Supported Platforms

| Platform | Status | Notes |
| -------- | ------ | ----- |
| macOS Apple Silicon, 14.0 Sonoma or newer | Supported | This tap |
| macOS Intel | Not supported | — |

## Prerequisites

- **macOS 14.0 (Sonoma) or newer on Apple Silicon**
- **Xcode Command Line Tools** (`xcode-select --install`)
- **Homebrew**
- **API key** from [physiology.presagetech.com](https://physiology.presagetech.com)
- **Apple Development signing identity** — required for SDK startup
  (the SDK reads keychain-backed credentials at runtime)

## Installation

### Add the tap

```bash
brew tap presage/smartspectra https://github.com/Presage-Security/homebrew-smartspectra
```

### Install the stable channel

```bash
brew install presage/smartspectra/smartspectra
```

The formula is self-contained — `opencv`, `vulkan-loader`, and
`molten-vk` are pulled in automatically. You do not need to install
OpenCV or any other SDK runtime libraries separately.

### Install the release-candidate channel (optional)

Release candidates ship as a separate formula. Stable and RC conflict
with each other; install only one at a time.

```bash
brew install presage/smartspectra/smartspectra-rc
```

To switch back to stable after an RC is promoted:

```bash
brew uninstall presage/smartspectra/smartspectra-rc
brew install presage/smartspectra/smartspectra
```

### Verify the install

```bash
pkg-config --modversion SmartSpectra
ls /opt/homebrew/lib/cmake/SmartSpectra
```

The first command prints the installed SDK version. The second lists
the `SmartSpectra` CMake config directory that
`find_package(SmartSpectra CONFIG REQUIRED)` consumes.

## First running build

The recommended starting point is the **SmartSpectra SwiftUI macOS
sample** — a native SwiftUI app that opens directly in Xcode and links
against the Homebrew-installed SDK. It demonstrates camera capture,
validation status, breathing/cardio metrics, and trend traces end to
end.

Match the branch to the formula channel you installed (`main` for
`smartspectra`, `rc` for `smartspectra-rc`):

```bash
git clone --branch main https://github.com/Presage-Security/SmartSpectra.git
cd SmartSpectra/cpp/samples/macos_swiftui_example
./scripts/check-requirements.sh --fix
open smartspectra_swift_ui.xcodeproj
```

Full walkthrough (signing, entitlements, expected behavior, common
mistakes): [SmartSpectra C++ Quickstart — macOS](https://smartspectra.presagetech.com/docs/cpp/macos).

## Installed paths

On Apple Silicon Homebrew installs, the default paths are:

- **Headers**: `/opt/homebrew/include/smartspectra/`
- **Libraries**: `/opt/homebrew/lib/`
- **CMake config**: `/opt/homebrew/lib/cmake/SmartSpectra/`
- **pkg-config**: `/opt/homebrew/lib/pkgconfig/SmartSpectra.pc`
- **License**: `/opt/homebrew/share/doc/smartspectra/LICENSE`

Consumer code includes SmartSpectra headers as:

```cpp
#include <smartspectra/smartspectra.h>
#include <smartspectra/smartspectra_config.h>
#include <smartspectra/messages/metrics.h>
```

### Using with CMake

```cmake
find_package(SmartSpectra CONFIG REQUIRED)
target_link_libraries(your_target PRIVATE SmartSpectra::SDK)
```

### Using with pkg-config

```bash
pkg-config --cflags SmartSpectra
pkg-config --libs SmartSpectra
```

## Updating

```bash
brew update
brew upgrade presage/smartspectra/smartspectra
```

(Use `smartspectra-rc` instead if you installed the RC channel.)

## Uninstalling

```bash
brew uninstall smartspectra        # or: smartspectra-rc
brew autoremove                    # remove unused dependencies (opencv, vulkan-loader, molten-vk)
brew untap presage/smartspectra
```

## License

The SmartSpectra SDK is distributed under a proprietary license
(`LicenseRef-Proprietary`). The full text is installed at
`/opt/homebrew/share/doc/smartspectra/LICENSE`.

## Support

- **Formula issues**:
  [github.com/Presage-Security/homebrew-smartspectra/issues](https://github.com/Presage-Security/homebrew-smartspectra/issues)
- **SDK documentation**: [smartspectra.presagetech.com](https://smartspectra.presagetech.com/)
- **SDK issues**:
  [github.com/Presage-Security/SmartSpectra/issues](https://github.com/Presage-Security/SmartSpectra/issues)
- **Email**: [support@presagetech.com](mailto:support@presagetech.com)
