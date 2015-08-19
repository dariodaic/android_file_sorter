lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Android File Sorter"
  spec.version       = "1.0.0"
  spec.date          = "2015-08-19"
  spec.authors       = [ "Dario Daic" ]
  spec.email         = [ "dariodaic5.1@gmail.com" ]
  spec.homepage      = "http://rubygems.org/gems/android_file_sorter"
  spec.summary       = %q{Ruby script for renaming files copied from Android OS 4.3.}
  spec.description   = %q{I wrote this gem so I can easier manage all my files once I copy them from my Android phone.}
  spec.license       = "MIT"

  spec.executables   << "android_file_sorter"
  spec.files         = [ "lib/android_file_sorter.rb",
                         "lib/android_file_sorter/file_renamer.rb",
                         "lib/android_file_sorter/entries_validator.rb",
                         "lib/android_file_sorter/description.rb",
                         "lib/android_file_sorter/directory_statistic.rb" ]
  spec.test_files    = [ "spec/image_renamer_spec.rb" ]
  spec.require_paths = [ "lib" ]

  spec.add_development_dependency "rspec", "~>3.1", ">= 3.1.7"
end
