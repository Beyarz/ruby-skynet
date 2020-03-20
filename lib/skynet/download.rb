# frozen_string_literal: true

module Download
  def default_download_options
    {
      portal_url: 'https://siasky.net'
    }
  end

  def download_file(path, skylink, options = nil); end

  def download_file_request(skylink, options = nil, stream = false); end
end
