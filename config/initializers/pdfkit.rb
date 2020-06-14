PDFKit.configure do |config|
  config.wkhtmltopdf = '/home/harri/.rbenv/shims/wkhtmltopdf'
  config.default_options = {
    :page_size => 'A4',
    :encoding      => 'UTF-8',
    :print_media_type => true
  }
  config.default_options[:load_error_handling] = 'ignore'
end
