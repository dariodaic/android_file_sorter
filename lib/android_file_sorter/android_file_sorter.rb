require "./description"
require "./entries_validator"
require "./directory_statistic"
require "./file_renamer"
require "time"
require 'pry'

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

AndroidFileSorter.new(Dir.pwd).rename_all

