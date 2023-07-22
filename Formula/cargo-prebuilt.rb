class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  version "0.6.0"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    root_url "https://github.com/crow-rest/homebrew-harmless/releases/download/cargo-prebuilt-0.6.0"
    sha256 cellar: :any_skip_relocation, monterey:     "a0c802260eb5128ea712a70a29bd997eadb1526611e4e99db2bb826c4d2d22af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "593a8ccdac2e36354bbbb45f7ef0f353e715e9e180e9fc85afa3f7abe8fd5554"
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-apple-darwin.tar.gz"
      sha256 "fdcca8d4df99278586fcb3cab3cb89a88082fc939fedd24e059f69481a734bb4"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-apple-darwin.tar.gz"
      sha256 "c0851bc7a378f24578c6ce8d40c32a5caf1e09d6fdc0ff7d021179c8849eca2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b169b491c516fac27cbd7c3559fa578581a19e6250487270a2037c52c70855db"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v#{version}/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c262e57640c84a08c2c36e41e3cb70fd6e5ff1ee97ba26cff2f00c7d8f79acec"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
