# temporary install binary method, will switch to build from source eventually

RELEASE_VERSION = "v0.11.1"
HEAD_VERSION = "v0.11.1"

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/#{RELEASE_VERSION}/gammacli-mac-#{RELEASE_VERSION}.tar.gz"
    sha256 "03a73e02fb47664debf5c78422fe8f66599f53de1c17e94d0e1de06c0e387606"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/#{RELEASE_VERSION}/gammacli-linux-x86-64-#{RELEASE_VERSION}.tar.gz"
    sha256 "fc8f08e447a3cd3629770d45f525f1da9342529e8d429f6c6979d416eae3c66d"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  head do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/#{HEAD_VERSION}/gammacli-mac-#{HEAD_VERSION}.tar.gz"
      sha256 "03a73e02fb47664debf5c78422fe8f66599f53de1c17e94d0e1de06c0e387606"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/#{HEAD_VERSION}/gammacli-linux-x86-64-#{HEAD_VERSION}.tar.gz"
      sha256 "fc8f08e447a3cd3629770d45f525f1da9342529e8d429f6c6979d416eae3c66d"
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
