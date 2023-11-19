class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.6.4"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.6.4"
    sha256 cellar: :any_skip_relocation, monterey:     "37c0a8a939315c46a5a9e49a1c6b09c48fc9b56876e01e29ac9723ad288e581a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a9058e4e4b414da97af79aaee690a3250cf70c47c4c66cd0b2d6610a9de9f8bb"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "6b9418e5db278d00426d2092f85ce2673239dfaab4dc00602bf720420dbc107a"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "c4611f5348b41592177621972c0556803d8a9752aa3277a7e70c621b38c5545f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32a04d8c3be6cfe5c91de63727432b4f047e091691d532659f62482bb53e5ccc"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa726e0a0f3510d258a11e784baf7e2f6a5ad2d5ea9eb03402281891b0d64296"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
