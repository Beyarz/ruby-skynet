# frozen_string_literal: true

# Module with helpful utilities and default settings
module Helper
  # The default skynet portal
  PORTAL_URL = 'https://siasky.net/'

  # Prefix for the protocol
  URI_SKYNET_PREFIX = 'sia://'

  # Module for keeping download settings
  module Download
    # Default options for the download module
    def self.default_options
      {
        portal_url: Helper::PORTAL_URL,
        download: true
      }
    end

    # Removes the Skynet::URI_SKYNET_PREFIX constant from string
    def self.strip_prefix(str)
      return nil if str.nil?

      if str.index(URI_SKYNET_PREFIX).nil?
        str
      else
        str.delete_prefix(URI_SKYNET_PREFIX)
      end
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
        custom_filename: nil
      }
    end

    # Removes "./" from a given filename if provided
    def self.strip_dotslash_path(file_path)
      return nil if file_path.nil?

      if file_path.start_with?('./')
        file_path.delete_prefix('./')
      else
        file_path
      end
    end
  end
end
