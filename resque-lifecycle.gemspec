$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "resque-lifecycle"

Gem::Specification.new name, "0.1.2" do |s|
  s.summary = "Adds job lifecycle data to Resque payloads"
  s.authors = ["Michael Grosser", "bitbckt"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "MIT"
  cert = File.expand_path("~/.ssh/gem-private-key-grosser.pem")
  if File.exist?(cert)
    s.signing_key = cert
    s.cert_chain = ["gem-public_cert.pem"]
  end
end
