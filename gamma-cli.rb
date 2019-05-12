# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-mac-v0.6.7.tar.gz"
    sha256 "934418527b26f9a03cc90b3bfecebcfa43fdda8feee2c3352f6b6a7ed6b75824"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-linux-x86-64-v0.6.7.tar.gz"
    sha256 "8a8c70ae70096fa7b87095d2cd63d29b7e78bd449aa5cf4ef2dca3f4048f7d9c"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-mac-v0.6.7.tar.gz"
      sha256 "934418527b26f9a03cc90b3bfecebcfa43fdda8feee2c3352f6b6a7ed6b75824"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.6.7/gammacli-linux-x86-64-v0.6.7.tar.gz"
      sha256 "8a8c70ae70096fa7b87095d2cd63d29b7e78bd449aa5cf4ef2dca3f4048f7d9c"
    else
      ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
    end  
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
        Install it from: https://docs.docker.com/install/
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
