class CwdStatistic

  def initialize(cwd)
    @user_files = Dir.entries(cwd).select { |file| ![ ".", "..", ".DS_Store",
                                                      "entries_validator.rb",
                                                      "renamer.rb",
                                                      "cwd_statistic.rb" ].include?(file) }
    @stats = { sum: 0, formats: {}, dates: {} }
  end

  def render_stats
    compile_statistic
    puts "# of all files: #{@stats[:sum]}"
    puts "Formats:"
    @stats[:formats].each { |format, count| puts("  #{format}: #{count}") }
    puts "Dates:"
    @stats[:dates].each { |date, count| puts("  #{date}: #{count}") }
  end

  def compile_statistic
    @user_files.each do |file|
      count_format(file.split(".").last.to_sym)
      count_date(DateTime.parse(file.split("_").first))
      increment_file_count
    end
    @stats
  end

  def count_format(format)
    @stats[:formats].has_key?(format) ? @stats[:formats][format] += 1 : @stats[:formats][format] = 1
  end

  def count_date(date_time)
    date = "#{date_time.year}-#{date_time.month}-#{date_time.day}".to_sym
    @stats[:dates].has_key?(date) ? @stats[:dates][date] += 1 : @stats[:dates][date] = 1
  end

  def increment_file_count
    @stats[:sum] += 1
  end

end
