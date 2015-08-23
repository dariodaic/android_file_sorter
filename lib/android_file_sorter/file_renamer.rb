class FileRenamer
  include Description

  def initialize(current_directory)
    @cwd = current_directory
    @user_files = Dir.entries(@cwd).select { |file| ![ ".", "..", ".DS_Store" ].include?(file) }
    @filesets = collect_filesets
    @file_dates = @filesets.keys
  end

  def process_files
    documentation
    rename_files
  end

  def rename_files
    options

    loop do
      date = @file_dates.first
      puts "Next file set: #{date}."
      print ">> "

      case gets.chomp
      when "l"
        @file_dates.shift
      when "a"
        @file_dates.shift
        automatic_renaming(date)
      when "d"
        documentation
      when "e"
        puts "Exiting program."
        exit
      when "r"
        @file_dates.shift
        puts "Enter a fileset name:"
        print ">> "
        user_filename = gets.chomp.gsub(/\s/, "_")
        user_renaming(date, user_filename)
      else
        puts "Enter one of the available options."
        options
      end

      if @file_dates.empty?
        puts "All of your files are renamed."
        exit
      end
    end
  end

  private

  def automatic_renaming(date)
    @filesets[date].inject(0) do |memo, file|
      file_array = file.split(".")
      timestamp, format = file_array.first, file_array.last
      datetime = DateTime.parse(timestamp).strftime("%Y-%m-%d_%a")
      new_filename = "#{datetime}_#{memo += 1}.#{format}"
      File.rename(file, new_filename)
      memo
    end
  end

  def user_renaming(date, user_filename)
    @filesets[date].inject(0) do |memo, file|
      file_array = file.split(".")
      timestamp, format = file_array.first, file_array.last
      day = DateTime.parse(timestamp).strftime("%a")
      new_filename = "#{user_filename}_#{date}_#{day}_#{memo += 1}.#{format}"
      File.rename(file, new_filename)
      memo
    end
  end

  def collect_filesets
    @user_files.each_with_object({}) do |file, obj|
      date = DateTime.parse(file.split(".").first).strftime("%Y-%m-%d")
      obj[date] = [] unless obj[date]
      obj[date] << file
    end
  end

end

