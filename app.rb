require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end

post '/' do
  @string = params[:text].to_s.reverse
  haml :index
end

get '/applications.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :applications
end

helpers do
  def clippy(text, bgcolor='#FFFFFF')
  html = <<-EOF

    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
            width="110"
            height="14"
            id="clippy" >
    <param name="movie" value="/flash/clippy.swf"/>
    <param name="allowScriptAccess" value="always" />
    <param name="quality" value="high" />
    <param name="scale" value="noscale" />
    <param NAME="FlashVars" value="text=#{text}">
    <param name="bgcolor" value="#{bgcolor}">
    <embed src="/flash/clippy.swf"
           width="110"
           height="14"
           name="clippy"
           quality="high"
           allowScriptAccess="always"
           type="application/x-shockwave-flash"
           pluginspage="http://www.macromedia.com/go/getflashplayer"
           FlashVars="text=#{text}"
           bgcolor="#{bgcolor}"
    />
    </object>
  EOF
  end 
end
