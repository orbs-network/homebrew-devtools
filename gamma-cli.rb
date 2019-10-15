# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.8.0/gammacli-mac-v0.8.0.tar.gz"
    sha256 "97cd6a8ade4ce3027c1d504b2f2baaa7c6930992bb8a5000dc502423af2382a6"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.8.0/gammacli-linux-x86-64-v0.8.0.tar.gz"
    sha256 "247324bc9a6d7f8de973a9a2560104d165ad96b8b15d817713adf8e72dd3d453"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.8.0/gammacli-mac-v0.8.0.tar.gz"
      sha256 "97cd6a8ade4ce3027c1d504b2f2baaa7c6930992bb8a5000dc502423af2382a6"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.8.0/gammacli-linux-x86-64-v0.8.0.tar.gz"
      sha256 "247324bc9a6d7f8de973a9a2560104d165ad96b8b15d817713adf8e72dd3d453"
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
