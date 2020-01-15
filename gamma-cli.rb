# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.10.0/gammacli-mac-v0.10.0.tar.gz"
    sha256 "8f50a52ab54e16b62d0c0202be3bdb3205e266c787e4a0d08342c2d1885a3155"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.10.0/gammacli-linux-x86-64-v0.10.0.tar.gz"
    sha256 "816ee6f48f47fbda19f00d503e084b582089fece932e464eabea41a41d3dcf03"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.10.0/gammacli-mac-v0.10.0.tar.gz"
      sha256 "8f50a52ab54e16b62d0c0202be3bdb3205e266c787e4a0d08342c2d1885a3155"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.10.0/gammacli-linux-x86-64-v0.10.0.tar.gz"
      sha256 "816ee6f48f47fbda19f00d503e084b582089fece932e464eabea41a41d3dcf03"
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
