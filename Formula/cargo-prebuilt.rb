class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.6.2"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.6.2"
    sha256 cellar: :any_skip_relocation, monterey:     "975a9a868969d21ffb761d764170239db24076a62b0e7e5821724886f094ba35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0cd5b1a0087d9849fe8b285bc8665df69bf74d8aac73697f0ab5d706fda6cae2"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "36e1ea6081e14846b16fb4e27f6421709ea67aeb14fcfa8e6ca78ed13937b771"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "b15f0d620aa69ed962e2edec010ef859e37e50297c5070c4a5262df002459202"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21c07fbae6bb84fef2c896e0d955aad7e12b9a7962d47ea62a0cccb330be5dbd"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d35bd6a1f766e5639c56142736b7eb3b6d7a3aa1d826d451044298d50e226dc8"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
