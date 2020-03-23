# frozen_string_literal: true

# Class with general settings
module Helper

  # The default skynet portal
  PORTAL_URL = 'https://siasky.net/'

  # Module for keeping download settings
  module Download

    # Default options for the download module
    def self.default_options
      {
        portal_url: Helper::PORTAL_URL,
        download: true
      }
    end
  end

  # Module for keeping upload settings
  module Upload

    # Default options for the upload module
    def self.default_options
      {
        portal_url: Helper::PORTAL_URL,
        portal_upload_path: 'skynet/skyfile',
        portal_file_fieldname: 'file',
        portal_directory_fieldname: 'files[]',
        custom_filename: nil,
      }
    end
  end
end
