class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  url "https://github.com/orbs-network/homebrew-gamma-cli/releases/download/v0.5.0/gammacli-mac.tar.gz"
  sha256 "45bc012355984978f2e92ac496829f8ebc572f11fe0963f61dfadc64ae257b50"

  def install
    system "cp", "./gamma-cli", bin/"gamma-cli"
  end

  test do
    gamma-cli version
  end
end
