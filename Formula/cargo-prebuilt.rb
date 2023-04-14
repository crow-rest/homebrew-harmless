class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.5.2"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.5.2"
    sha256 cellar: :any_skip_relocation, monterey:     "e0ace8a3d5983b66c8f8aaeffb39fe13a1072ebdf58caa12729400c80de949c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "38020d3f17bc9f6eeba95dd173c20cd94bad07f13c3c90aecd87741b4dd87abe"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "1f1c48355a0c3bf56fb0be20537b6cbbfc5fb4903e8b51e525bd0a0d9435e73d"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "a4744b96db69397b53f1588779f2d4545afe55d5ddbd571690f2e7166851d65c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fdb8f7457f80c2a511a3ce9a3fa9fe0ff12a1947bd480eca64b37bb26ce65f2"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60e871d08cbbd6bffaab907b23bb7651b9e3f1603a88c97b441f4266f091af0a"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
