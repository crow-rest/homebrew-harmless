class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.6.3"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "0671d9e54dd9c03bd05a6c97d2517a2fba4c78694fdbfb0808ad63c254af8a24"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "44d2ab948aa7ea45092aff548d496297ca155dea68528e7be5986f3ae8de9879"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2a98948a501637eb9b322b0d776b6c72bce11db56e1240e989da436d1cd2982"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a1d3f05bf521fa5ead8f468cc4c307142154c25049470f492a91e0c7d27c012"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
