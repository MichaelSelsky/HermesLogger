Pod::Spec.new do |s|
  s.name             = "HermesLogger"
  s.version          = "0.1.0"
  s.summary          = "An extensible logging framework built in Swift."

  s.description      = <<-DESC
HermesLogger is a small, extensible, logging framework built in Swift using generics and protocols.

Currently supports XcodeColors.
                       DESC

  s.homepage         = "https://github.com/MichaelSelsky/HermesLogger"
  s.license          = 'MIT'
  s.author           = { "Michael Selsky" => "Michael@Selsky.me" }
  s.source           = { :git => "https://github.com/MichaelSelsky/HermesLogger.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MichaelSelsky'

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = 'Pod/Classes/*.swift'
  end
end
