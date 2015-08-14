require "./cwd_statistic"
require "./entries_validator"
require "time"
require "pry"

class ImageRenamer

  def rename_all
    # remove this Dir.pwd later
    cwd = Dir.pwd
    EntriesValidator.new(cwd).validate_entries
    CwdStatistic.new(cwd).render_stats
    # CwdStatistic.new(Dir.pwd).render_stats
    #2.show_statistic
    #3.rename_files
  end

end

ImageRenamer.new.rename_all
