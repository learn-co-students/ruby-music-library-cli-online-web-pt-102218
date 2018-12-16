  def data_from_filename(filename)
    data = {}
    data[:a_name], data[:s_name], data[:g_name] = filename.chomp!('.mp3').split(' - ')
    data
  end