# temporary install binary method, will switch to build from source before V1 release

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  url "https://github.com/orbs-network/homebrew-gamma-cli/releases/download/v0.5.1/gammacli-mac-v0.5.1.tar.gz"
  sha256 "e23d23a9c05f1e01dbb1107d7fcd6deb477ecbd5651d62b55e45514e4a73ac37"
  head "https://github.com/orbs-network/homebrew-devtools"

  def install
    system "mkdir", "-p", bin
    system "cp", "./gamma-cli", bin/"gamma-cli"
  end

  test do
    system "gamma-cli", "version"
  end
end
