class CargoPrebuilt < Formula
  desc "Cli tool to download prebuilt binaries of some crate.io crates"
  homepage "https://github.com/cargo-prebuilt/cargo-prebuilt"
  license "MIT"
  head "https://github.com/cargo-prebuilt/cargo-prebuilt.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.7/x86_64-apple-darwin.tar.gz"
      sha256 "c8f2a0d50be4ae8fbcc2b4fc2f61806c81db8378fabfd95c5708c8c8fc33d811"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.7/aarch64-apple-darwin.tar.gz"
      sha256 "27535ffefe6b9e6f68cd274380d1329d6705cc38d5c44aeeecee052779bba414"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.7/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01688527aaed11c65b5e7b4848e92426d76523236477f32ffd96b6a0cdf3f513"
    end
    on_arm do
      url "https://github.com/cargo-prebuilt/cargo-prebuilt/releases/download/v0.6.7/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7a95404e920e3cf524560c8041901f6dfbcf9f8bf0d4ca3ee8a108cfecdc603"
    end
  end

  def install
    bin.install "cargo-prebuilt"
  end

  test do
    system "#{bin}/cargo-prebuilt", "--path=#{testpath}", "just"
  end
end
