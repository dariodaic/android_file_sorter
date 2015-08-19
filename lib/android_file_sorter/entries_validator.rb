class EntriesValidator

  def initialize(current_directory)
    @cwd = current_directory
    @valid_formats = [ "jpg", "mp4" ]
    @system_files = [ ".", "..", ".DS_Store", "android_file_sorter", "android_file_sorter.rb" ]
  end

  def validate_entries
    user_files = Dir.entries(@cwd).select { |file| !@system_files.include?(file) }
    filtered_entries = filter_entries(user_files)
    if invalid_entries?(filtered_entries)
      notify_user(filtered_entries)
      exit
    end
  end

  private

  def filter_entries(user_files)
    invalid_entries = {
      dirs: [],
      invalid_formats: [],
      invalid_lengths: []
    }
    user_files.each do |e|
      if Dir.exist?(e)
        invalid_entries[:dirs] << e
      elsif !@valid_formats.include?(e.split(".").last)
        invalid_entries[:invalid_formats] << e
      elsif e.length != 19
        invalid_entries[:invalid_lengths] << e
      end
    end
    invalid_entries
  end

  def invalid_entries?(entries)
    entries.values.each { |val| return true unless val.empty?  }
    false
  end

  def notify_user(entries)
    dir_count = entries[:dirs].count
    invalid_formats = entries[:invalid_formats].count
    invalid_lengths = entries[:invalid_lengths].count
    puts "Your directory must be empty."
    puts "It must not contain any directories or files that are not images or videos."
    puts "Currently your working directory contains:"
    puts "  directories: #{dir_count}" unless dir_count.zero?
    puts "  files with invalid formats: #{invalid_formats}" unless invalid_formats.zero?
    puts "  files with invalid lengths: #{invalid_lengths}" unless invalid_lengths.zero?
    puts "Please empty your directory. Afterwards, copy your images into it."
  end

end

