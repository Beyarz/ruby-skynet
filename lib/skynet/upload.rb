# frozen_string_literal: true

module Upload
  def default_upload_options
    {
      portal_url: 'https://siasky.net',
      portal_upload_path: 'skynet/skyfile',
      portal_file_fieldname: 'file',
      portal_directory_file_fieldname: 'files[]',
      custom_filename: ''
    }
  end

  def upload_file_request(path, options = nil)
    options = default_upload_options if options.nil?

    file = File.open(path, 'rb')
    file.close
    host = options[:portal_url]
    path = options[:portal_upload_path]
    url = "#{host}/#{path}"

    req = HTTParty.post(url, options[:portal_file_fieldname])
    req
  end

  def upload_file(path, options = nil)
    upload_request = upload_file_request(path, options).to_json
    parsed_request = JSON.parse(upload_request)
    URI_SKYNET_PREFIX + parsed_request['skylink']
  end

  def upload_file_request_with_chunks(path, options = nil)
    options = default_upload_options if options.nil?

    file = options[:custom_filename] || path
    req = HTTParty.post(
      "#{options[:portal_url]}/#{options[:portal_upload_path]}?filename=#{file}"
    )
    req
  end

  def walk_directory(path)
    files = {}
  end

  def upload_directory_request(path, options = nil)
    if Dir.exist?(path)
      puts "Given path is not a directory"
    end

    if options.nil?
      options = default_upload_options
    end

    ftuples = []
    files = walk_directory(path)
  end

  def upload_directory(path, options = nil)
    r = upload_directory_request(path, options)
    parsed_r = JSON.parse(r.to_json)
    sia_url = "#{URI_SKYNET_PREFIX}#{parsed_r['skylink']}"
  end
end
