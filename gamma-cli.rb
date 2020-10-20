# temporary install binary method, will switch to build from source eventually

RELEASE_VERSION = "v0.11.0"
HEAD_VERSION = "v0.11.0"

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/#{RELEASE_VERSION}/gammacli-mac-#{RELEASE_VERSION}.tar.gz"
    sha256 "91421649ccd1b23319968e9fe334567bd7d7d2d9097036706aaa43a6a1e7e956"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/#{RELEASE_VERSION}/gammacli-linux-x86-64-#{RELEASE_VERSION}.tar.gz"
    sha256 "cc2b242fc73524a37a9bf556880eaffa7dc7893104062e2b0ffaa927185cda37"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  head do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/#{HEAD_VERSION}/gammacli-mac-#{HEAD_VERSION}.tar.gz"
      sha256 "91421649ccd1b23319968e9fe334567bd7d7d2d9097036706aaa43a6a1e7e956"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/#{HEAD_VERSION}/gammacli-linux-x86-64-#{HEAD_VERSION}.tar.gz"
      sha256 "cc2b242fc73524a37a9bf556880eaffa7dc7893104062e2b0ffaa927185cda37"
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
