# frozen_string_literal: true

# Class with general settings
module Helper
  PORTAL_URL = 'https://siasky.net/'

  # Module for keeping download settings
  module Download
    def self.default_options
      {
        portal_url: Helper::PORTAL_URL
      }
    end
  end

  # Module for keeping upload settings
  module Upload
    def self.default_options
      {
        portal_url: Helper::PORTAL_URL,
        portal_upload_path: 'skynet/skyfile',
        portal_directory_fieldname: 'files[]',
        custom_filename: nil,
        portal_file_fieldname: 'file',
        download: false
      }
    end
  end
end
