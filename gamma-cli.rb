# temporary install binary method, will switch to build from source before V1 release

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  url "https://github.com/orbs-network/homebrew-devtools/releases/download/v0.5.6/gammacli-mac-v0.5.6.tar.gz"
  sha256 "c7bc6718a1e690cd2482818d6c30524077594d6885e1df17e81c76fee6a99dd2"
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    url "https://github.com/orbs-network/homebrew-devtools/releases/download/v0.6.2/gammacli-mac-v0.6.2.tar.gz"
    sha256 "515d176fb4a95f3b8fff3fdc0b93597e62c872d9bb50b38337156a212f02afae"
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
