lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  # required
  spec.author                = "dariodaic"
  spec.name                  = "android_file_sorter"
  spec.version               = "1.0.0"
  spec.files                 = [ "lib/android_file_sorter.rb,
                                  lib/android_file_sorter/description.rb,
                                  lib/android_file_sorter/entries_validator.rb,
                                  lib/android_file_sorter/directory_statistic.rb,
                                  lib/android_file_sorter/file_renamer.rb" ]
  spec.require_paths         = [ "lib" ]
  spec.summary               = %q{Ruby script for renaming files copied from Android OS 4.3.}

  # recommended
  spec.license               = "MIT"

  # optional
  spec.date                  = "2015-08-23"
  spec.email                 = [ "dariodaic5.1@gmail.com" ]
  spec.description           = %q{Tiny gem for managing files copied from Android OS 4.3.}
  spec.executables           << "android_file_sorter"
  spec.required_ruby_version = ">= 2.2.0"
  spec.add_development_dependency "rspec", "~>3.1", ">= 3.1.7"
end

