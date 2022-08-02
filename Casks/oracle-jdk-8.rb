cask "oracle-jdk-8" do

  version "1.8.0"

  url "https://javadl.oracle.com/webapps/download/GetFile/1.8.0_321-b07/df5ad55fdd604472a86a45a217032c7d/unix-i586/jre-8u321-macosx-x64_pkg.dmg"
  name "Oracle Java Standard Edition Runtime Environment"
  desc "JRE from Oracle"
  homepage "https://gist.github.com/wavezhang/ba8425f24a968ec9b2a8619d7c2d86a6"

  pkg "Java 8 Update 321.pkg"

  uninstall pkgutil: "com.oracle.jre"
end
