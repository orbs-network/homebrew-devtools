# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.9.0/gammacli-mac-v0.9.0.tar.gz"
    sha256 "5f827591b4c538e53711340bac40fc664e06c90f09a823a09ce96dfd141aa16a"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.9.0/gammacli-linux-x86-64-v0.9.0.tar.gz"
    sha256 "7d100a98713106075a2b250c94bb147f5037e6c727d39b7c9407362e0deb647c"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.9.0/gammacli-mac-v0.9.0.tar.gz"
      sha256 "5f827591b4c538e53711340bac40fc664e06c90f09a823a09ce96dfd141aa16a"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.9.0/gammacli-linux-x86-64-v0.9.0.tar.gz"
      sha256 "7d100a98713106075a2b250c94bb147f5037e6c727d39b7c9407362e0deb647c"
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
      system "gamma-cli upgrade-server"
    rescue
      s = <<~EOS
        An error occured when running gamma-cli.
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
