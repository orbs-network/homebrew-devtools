# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-mac-v0.6.7.tar.gz"
  sha256 "934418527b26f9a03cc90b3bfecebcfa43fdda8feee2c3352f6b6a7ed6b75824"
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-mac-v0.6.7.tar.gz"
    sha256 "934418527b26f9a03cc90b3bfecebcfa43fdda8feee2c3352f6b6a7ed6b75824"
  end
  
  def install
    system "mkdir", "-p", bin
    system "cp", "./gamma-cli", bin/"gamma-cli"
  end
  
  def post_install
    begin
      ohai "Downloading latest version of Gamma server..."
      system "gamma-cli upgrade-server 2>/dev/null"
    rescue
      s = <<~EOS
        Docker is required to run Gamma server but is not installed on your machine.
        Install it from: https://docs.docker.com/docker-for-mac/install/
      EOS
      opoo s  
    end
    s = <<~EOS
*********************************************************************************
                        Orbs Personal Blockchain - Gamma

  Gamma is a local Orbs blockchain instance for smart contract developers.

  gamma-cli - The command line interface for interacting with Gamma server.
              Run 'gamma-cli help' to see all available commands.

**********************************************************************************

    EOS
    ohai "Done", s
  end

  test do
    system "gamma-cli", "version"
  end
end
