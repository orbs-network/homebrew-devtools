# temporary install binary method, will switch to build from source eventually

class GammaCli < Formula
  desc "Command line tools for Orbs Gamma personal blockchain"
  homepage "https://github.com/orbs-network/orbs-contract-sdk"
  if OS.mac?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.7.0/gammacli-mac-v0.7.0.tar.gz"
    sha256 "f06290d07dbb10ea6006be2cb274e14ba19e76f01d124eed50b1737723678a96"
  elsif OS.linux?
    url "https://github.com/orbs-network/gamma-cli/releases/download/v0.7.0/gammacli-linux-x86-64-v0.7.0.tar.gz"
    sha256 "599d1029c0e71df1737e08e03ed88f4de72d592684f6c7ef170d27c7862b9b47"
  else
    ohdie "Your operating system is not supported by this formula, if you feel this is a mistake please contract Orbs"
  end  
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    if OS.mac?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.7.0/gammacli-mac-v0.7.0.tar.gz"
      sha256 "f06290d07dbb10ea6006be2cb274e14ba19e76f01d124eed50b1737723678a96"
    elsif OS.linux?
      url "https://github.com/orbs-network/gamma-cli/releases/download/v0.7.0/gammacli-linux-x86-64-v0.7.0.tar.gz"
      sha256 "599d1029c0e71df1737e08e03ed88f4de72d592684f6c7ef170d27c7862b9b47"
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
