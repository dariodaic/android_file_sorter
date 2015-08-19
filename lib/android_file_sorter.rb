require "./image_renamer/renamer"
require "./image_renamer/cwd_statistic"
require "./image_renamer/entries_validator"
require "time"

ImageRenamer.new.rename_all
