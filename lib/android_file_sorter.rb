require "android_file_sorter/directory_statistic"
require "android_file_sorter/entries_validator"
require "android_file_sorter/description"
require "android_file_sorter/file_renamer"
require "time"

class AndroidFileSorter

  def initialize(current_directory)
    @cwd = current_directory
  end

  def rename_all
    EntriesValidator.new(@cwd).validate_entries
    DirectoryStatistic.new(@cwd).render_stats
    FileRenamer.new(@cwd).process_files
  end

end

