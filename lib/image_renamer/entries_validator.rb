class EntriesValidator

  def initialize(current_directory)
    @cwd = current_directory
    @valid_formats = [ "jpg", "mp4" ]
    @system_files = [ ".", "..", ".DS_Store",
                      "entries_validator.rb",
                      "renamer.rb",
                      "cwd_statistic.rb" ]
  end

  def validate_entries
    user_entries = Dir.entries(@cwd).select { |file| !@system_files.include?(file) }
    filtered_entries = filter_entries(user_entries)
    if any_invalid_entries?(filtered_entries)
      notify_user(filtered_entries)
      exit
    end
  end

  private

  def filter_entries(entries)
    invalid_entries = { dirs: [], other: [] }
    entries.each do |e|
      if Dir.exist?(e)
        invalid_entries[:dirs] << e
      elsif !@valid_formats.include?(e.split(".").last)
        invalid_entries[:other] << e
      end
    end
    invalid_entries
  end

  def any_invalid_entries?(entries)
    entries.values.each { |val| return true unless val.empty? }
    false
  end

  def notify_user(entries)
    dir_count, file_count = entries[:dirs].count, entries[:other].count
    puts "Your directory must be empty."
    puts "It must not contain any directories or files that are not images or videos."
    puts "Currently your working directory contains:"
    puts "  directories: #{dir_count}" unless dir_count.zero?
    puts "  invalid files: #{file_count}" unless file_count.zero?
    puts "Please empty your directory. Afterwards, copy your images into it."
  end

end
