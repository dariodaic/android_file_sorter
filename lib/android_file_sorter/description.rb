module Description

  def documentation
    puts <<-DOC

How do your files get renamed?
------------------------------
You are naming dates, not files. That means that if you have eleven files recorded on the
same day, after your provide your new name e.g. "My birthday", all files recorded on the same day
will be renamed to "My_birthday".
For convenience, ImageRenamer will give each file a number "My_birthday_1" and remove a time stamp.
This way, you will still know the order in which files were recorded (you took pictures).
Final name will include a date stamp however, so our example files will be named
"My_birthday_1_2015-08-15".

    DOC
  end

  def options
    puts <<-OPTIONS
Proceed with renaming your files:
 - [ l ] leave a fileset as is
 - [ i ] let ImageRenamer name files for you
 - [ d ] show documentation
 - [ e ] exit program
 - [ r ] rename files yourself

    OPTIONS
  end

end

