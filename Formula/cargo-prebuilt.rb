class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.6.5"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.6.5"
    sha256 cellar: :any_skip_relocation, ventura:      "c26afc1c2ee7a681d3f035c65fb2dd38e4731821d143deda1c31e3186cb307d2"
    sha256 cellar: :any_skip_relocation, monterey:     "c672194caff940a1a2656d732870f8d492869327684ba3c569b79b2dd3f3739d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c852f045822fb29e509f7d9c50efa9e7c5f0f34158676e0f6887291b8f2f0c6"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "bbfbd50f1cfe09cbec2ca2a09b5ec72815fd40dc75d98161652caf00ad81098e"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "f42fa7b85feeca03c0c15f1ff03a11568681d8862b9618da122a4417308ec91e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2adcdefb761af5e910cb21bc716753ffa93675b4d2cc429dcfafe3e66aa22a90"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e991765de2643faca650553cb5bac0716b22bc084840d5ebbbf243341d308277"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
