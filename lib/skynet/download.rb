# frozen_string_literal: true

module Download
  def default_download_options
    {
      portal_url: 'https://siasky.net'
    }
  end

  def download_file(path, skylink, options = nil)
    r = download_file_request(skylink, options)

    Kernel.open(path, 'r') do |chunk|
      # file = File.open("./#{DIR_NAME}/#{name}.extension", 'bw')
      # file.write chunk.read
      # file.close
    end
  end

  def download_file_request(skylink, options = nil, stream = false)
    options = default_download_options if options.nil?

    portal = options['portal_url']
    skylink = strip_prefix(skylink)
    url = "#{portal}/#{skylink}"
    req = HTTParty.get(url, follow_redirects: true)
    req
  end
end
