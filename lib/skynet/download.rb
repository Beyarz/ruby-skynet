# frozen_string_literal: true

# Module for handling inbound requests
module Download
  HTTP_REDIRECT_PERMANENT = [301, 302]

  def default_download_options
    {
      portal_url: 'https://siasky.net'
    }
  end

  def download_file(destination_path_name, skylink, options = nil, stream_body: true)
    options = default_download_options if options.nil?

    portal  = options['portal_url']
    skylink = strip_prefix(skylink)
    url     = "#{portal}/#{skylink}"

    file = File.open(destination_path_name, 'bw')
    HTTParty.get(url, follow_redirects: true, :stream_body) do |chunk|
      file.write chunk unless HTTP_REDIRECT_PERMANENT.include? chunk.code
      # file.write chunk.read unless HTTP_REDIRECT_PERMANENT.include?(chunk.code)
    end
    file.close
  end
end
