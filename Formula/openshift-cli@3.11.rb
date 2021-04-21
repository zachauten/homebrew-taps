class OpenshiftCliAT311 < Formula
  desc "OpenShift command-line interface tools"
  homepage "https://www.openshift.com/"
  url "https://github.com/openshift/origin.git",
      :tag      => "v3.11.0",
      :revision => "0cbc58b117403b9d9169dbafdfac59ef104bb997",
      :shallow  => false
  head "https://github.com/openshift/origin.git",
      :shallow  => false

  depends_on "coreutils" => :build
  depends_on "go@1.15" => :build
  depends_on "socat"

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/openshift/origin"
    dir.install buildpath.children - [buildpath/".brew_home"]

    cd dir do
      system "make", "all", "WHAT=cmd/oc", "GOFLAGS=-v"

      bin.install "_output/local/bin/darwin/amd64/oc"
      bin.install_symlink "oc" => "oadm"

      bash_completion.install Dir["contrib/completions/bash/*"]
    end
  end

  test do
    assert_match /^oc v#{version}/, shell_output("#{bin}/oc version")
    assert_match /^oc v#{version}/, shell_output("#{bin}/oadm version")
  end
end
