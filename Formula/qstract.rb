class Qstract < Formula
  desc "Very simple tar extract program"
  homepage "https://github.com/cargo-prebuilt/qstract"
  license "MIT"
  head "https://github.com/cargo-prebuilt/qstract.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/qstract-64-unknown-linux-gnu"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ed9bf7ee3828538405c78a63036cca749b0cee49fa48cfd4d7398349d94ae830"
    sha256 cellar: :any_skip_relocation, ventura:      "76f88c077e0994f42bf98102cd4bac1f35ca6a003d0ed75e11b955bf35755cad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "adb0ab0c9b976cac1c6bf2762f8800c95439200a1367844efb2598162e8f4539"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/qstract/releases/download/v0.1.0/qstract-x86_64-apple-darwin"
      sha256 "f62f7b336dab2c84fdccb366d97ce040fbabdd058fb2a0f27f64cfd16dbf02d6"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/qstract/releases/download/v0.1.0/qstract-aarch64-apple-darwin"
      sha256 "338292a33e7ceb94270376224001ad4bc54da6075cefb10eab3e2488fe7c8a09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/qstract/releases/download/v0.1.0/qstract-x86_64-unknown-linux-gnu"
      sha256 "67509f23847f58ae3d46c0920656a6b18df26b3dd892d0aee96efcd50b88f291"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/qstract/releases/download/v0.1.0/qstract-aarch64-unknown-linux-gnu"
      sha256 "f42772eda80616215e13e5452b1dd21d71eded74f3016d91c1607b962e9f4de1"
    end
  end

  def install
    if OS.mac?
      mv "qstract-x86_64-apple-darwin", "qstract" if Hardware::CPU.intel?
      mv "qstract-aarch64-apple-darwin", "qstract" if Hardware::CPU.arm?
    end

    if OS.linux?
      mv "qstract-x86_64-unknown-linux-gnu", "qstract" if Hardware::CPU.intel?
      mv "qstract-aarch64-unknown-linux-gnu", "qstract" if Hardware::CPU.arm?
    end

    bin.install "qstract"
  end

  test do
    system "#{bin}/qstract", "--version"
  end
end
