%w(sinatra roadie base64).each do |lib|
  require lib
end

before do
  @base64 = base64_images
end

get '/' do
  haml :email
end

get '/email' do
  content_type :text

  document = Roadie::Document.new haml(:email)
  document.asset_providers = [ Roadie::FilesystemProvider.new("public") ]
  document.transform
end

def base64_images(whitelist = %w(.png .jpg .gif))
  files = {}
  directory = "#{ settings.root }/base64"

  if File.exists?(directory)
    Dir.foreach(directory) do |file|
      if whitelist.include? File.extname(file)
        key = File.basename(file, File.extname(file)).to_sym
        files[key] = Base64.encode64(File.read("#{ directory }/#{ file }"))
      end
    end
  end

  files
end
