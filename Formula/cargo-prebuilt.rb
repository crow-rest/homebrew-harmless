class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.6.6"
    sha256 cellar: :any_skip_relocation, ventura:      "96b7127eeefd1d3cf787cdccbec916cb7ac802a45ddcca79326ec20a19389bb3"
    sha256 cellar: :any_skip_relocation, monterey:     "e8aec471889b15648659f7a2166d544362c2f27222ed56edc5d651b139404530"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c3d4cfb0bec72e32dcb1d3ad9367e1e861c44ba1b68badd8435b2df25a550622"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.6/x86_64-apple-darwin.tar.gz"
      sha256 "1bebe40675b263e79e6866140db54652a4ac84e138c9903dac5d7c45bbe4cecd"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.6/aarch64-apple-darwin.tar.gz"
      sha256 "fe7900e821b2b681447180b7c7ebc2e69bfe98d55b24c2b9d52905d65b570307"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.6/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "554e845d8131ed9efec377dc8df4cedc0485b8bc029febefe988cfb79d5a38b5"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.6/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f28f1475c29c2d9810cccace4569e143626a0e635283cccfd764c3beb3dcfafb"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
