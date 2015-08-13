lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "image_renamer"
  spec.version       = "1.0.0"
  spec.date          = "2015-08-13"
  spec.authors       = [ "Dario Daic" ]
  spec.email         = [ "dariodaic5.1@gmail.com" ]
  spec.homepage      = "http://rubygems.org/gems/image_renamer"
  spec.summary       = %q{Ruby script for renaming picture files from Android OS 4.3.}
  spec.description   = <<-DESC
Idea behind the project is to write a script that will enable a user to quickly rename all pictures from
his mobile device.
Android labels pictures with a datestamp of the following format "YYYMMDD_HHMMSS", which is not so
useful to me. What I prefer to do, is to give a same name to a series of pictures taken on the same day.
  DESC
  spec.license       = "MIT"

  spec.executables   << "image_renamer"
  spec.files         = [ "lib/image_renamer.rb" ]
  spec.test_files    = [ "spec/image_renamer_spec.rb" ]
  spec.require_paths = [ "lib" ]

  spec.add_development_dependency = "rspec"
end
