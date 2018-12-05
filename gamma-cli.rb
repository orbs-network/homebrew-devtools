# temporary install binary method, will switch to build from source before V1 release

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  url "https://github.com/orbs-network/homebrew-devtools/releases/download/v0.5.2/gammacli-mac-v0.5.2.tar.gz"
  sha256 "6c11a7e826f161c46de870a827495bbea59c94f87cd76c79b6e834b7a46b5483"
  head "https://github.com/orbs-network/homebrew-devtools"

  def install
    system "mkdir", "-p", bin
    system "cp", "./gamma-cli", bin/"gamma-cli"
  end
  
  def post_install
    begin
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
