class DirectoryStatistic

  def initialize(current_directory)
    @user_files = Dir.entries(current_directory).select { |file| ![ ".", "..", ".DS_Store"].include?(file) }
    @stats = { dates:   {},
               formats: {},
               sum:     0 }
  end

  def render_stats
    compile_statistic

    if @stats[:sum].zero?
      puts "Your directory is empty. Please put some files in it."
      exit
    else
      puts "Total number of all files: #{@stats[:sum]}"
      puts "Formats:"
      @stats[:formats].each { |format, count| puts("  #{format}: #{count}") }
      puts "Dates:"
      @stats[:dates].each { |date, count| puts("  #{date}: #{count}") }
    end
  end

  private

  def compile_statistic
    @user_files.each do |file|
      count_format(file.split(".").last.to_sym)
      count_date(DateTime.parse(file.split("_").first))
      @stats[:sum] += 1
    end
    @stats
  end

  def count_format(format)
    formats = @stats[:formats]
    @stats[:formats][format] = formats.has_key?(format) ? formats[format] + 1 : 1
  end

  def count_date(date_time)
    date = date_time.strftime("%Y-%m-%d").to_sym
    dates = @stats[:dates]
    @stats[:dates][date] = dates.has_key?(date) ? dates[date] + 1 : 1
  end

end

