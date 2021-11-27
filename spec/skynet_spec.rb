# frozen_string_literal: true

require_relative '../lib/skynet/helper.rb'

describe Helper::Download, '#strip_prefix' do
  context 'with a string containing URI_SKYNET_PREFIX' do
    it 'should strip of the URI_SKYNET_PREFIX' do
      strip = Helper::Download.strip_prefix('sia://test')
      expect(strip).to eq('test')
    end
  end

  context 'with a string not containing URI_SKYNET_PREFIX' do
    it 'should return exact same string' do
      strip = Helper::Download.strip_prefix('test')
      expect(strip).to eq('test')
    end
  end

  context 'with an empty string' do
    it 'should return empty string' do
      strip = Helper::Download.strip_prefix('')
      expect(strip).to eq('')
    end
  end

  context 'with nil as argument' do
    it 'should return nil' do
      strip = Helper::Download.strip_prefix(nil)
      expect(strip).to eq(nil)
    end
  end
end

describe Helper::Upload, '#strip_dotslash_path' do
  context 'with a string containing "./file.rb"' do
    it 'should return "./file.rb"' do
      strip = Helper::Upload.strip_dotslash_path('./file.rb')
      expect(strip).to eq('file.rb')
    end
  end

  context 'with a string containing "/file.rb"' do
    it 'should return "/file.rb"' do
      strip = Helper::Upload.strip_dotslash_path('/file.rb')
      expect(strip).to eq('/file.rb')
    end
  end

  context 'with a string containing "file.rb"' do
    it 'should return "file.rb"' do
      strip = Helper::Upload.strip_dotslash_path('file.rb')
      expect(strip).to eq('file.rb')
    end
  end
end
