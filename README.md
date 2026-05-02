# SmartSpectra SDK

Homebrew tap for Presage Security's SmartSpectra C++ SDK.

## Installation

### Add the Tap

First, add this custom Homebrew tap to your system:

```bash
brew tap presage/smartspectra https://github.com/Presage-Security/homebrew-smartspectra
```

### Install SmartSpectra

```bash
brew install presage/smartspectra/smartspectra
```

**Note**: PhysiologyEdge is automatically installed as a dependency.

## Usage

After installation, the SDK will be available in your Homebrew prefix (typically `/opt/homebrew` on Apple Silicon Macs):

- **Headers**: `/opt/homebrew/include/presagetech/`
- **Libraries**: `/opt/homebrew/lib/`
- **CMake config**: `/opt/homebrew/lib/cmake/SmartSpectra/`
- **pkg-config**: `/opt/homebrew/lib/pkgconfig/SmartSpectra.pc`

### Using with CMake

```cmake
find_package(SmartSpectra REQUIRED)
target_link_libraries(your_target SmartSpectra::SDK)
```

### Using with pkg-config

```bash
# Compile flags
pkg-config --cflags SmartSpectra

# Linker flags
pkg-config --libs SmartSpectra
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade presage/smartspectra/smartspectra
```

## Uninstalling

```bash
brew uninstall smartspectra
brew autoremove  # Remove unused dependencies (PhysiologyEdge, etc.)
brew untap presage/smartspectra
```

## Requirements

- macOS ARM64 (Apple Silicon)
- Homebrew
- Dependencies (PhysiologyEdge, OpenCV) are automatically installed

## Support

For issues with the Homebrew formulas, please file an issue at:
https://github.com/Presage-Security/homebrew-smartspectra/issues

For SDK documentation and support, visit:
https://physiology.presagetech.com

## About SmartSpectra

This repository hosts SmartSpectra SDK from PresageTech for measuring vitals such as pulse, breathing, and more using a camera. The SDK supports multiple platforms, including Android, iOS, and C++ for Mac/Linux.

For other platforms, visit: https://github.com/Presage-Security/SmartSpectra
