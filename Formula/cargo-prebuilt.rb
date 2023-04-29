class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.5.3"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "f22a16725f36f73b5c1153171da36cce40fce143fb44910ed42fae0fb105a5b0"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "01d0da1356dbc1b025fdfda58f4945109915ed2e8fa571f2dddf6be59e0dc3dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "206ae08d0db8e249097da9fac2134e008cad80f647588b746a2cdc350b05a42f"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14bfd654c237884ccd58c099da7f5cde5879b2a5f4199ec75799b51aaeb0db71"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
