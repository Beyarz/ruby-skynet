# frozen_string_literal: true

class Skynet
  def self.init
  end

  def uri_skynet_prefix()
  end

  def default_upload_options()
  end

  def default_download_options()
  end

  def strip_prefix(str)
  end

  def upload_file(path, options = nil)
  end

  def upload_file_request(path, options = nil)
  end

  def upload_file_request_with_chunks(path, options = nil)
  end

  def upload_directory(path, options = nil)
  end

  def upload_directory_request(path, options = nil)
  end

  def download_file(path, skylink, options = nil)
  end

  def download_file_request(skylink, options = nil, stream = false)
  end

  def walk_directory(path)
  end
end
