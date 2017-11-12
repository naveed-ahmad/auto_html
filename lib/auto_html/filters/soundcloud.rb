# encoding: UTF-8

# set these options and default values
# :width => '100%', :height => 166, :auto_play => false, :theme_color => '00FF00', :color => '915f33', :show_comments => false
AutoHtml.add_filter(:soundcloud).with(:width => '100%', :height => 166, :auto_play => false, :theme_color => '00FF00', :color => '915f33', :show_comments => false, :show_artwork => false) do |text, options|
  regexp = /(https?:\/\/)?(www.)?soundcloud\.com\/([A-Za-z0-9._%-]*)\/([A-Za-z0-9._%-]*)/
  
  text.gsub(regexp) do |match|
    match =~ regexp

    width         = options[:width]
    height        = options[:height]
    auto_play     = options[:auto_play]
    theme_color   = options[:theme_color]
    color         = options[:color]
    show_artwork  = options[:show_artwork]
    show_comments = options[:show_comments]
    url = "https://w.soundcloud.com/player/?url=https://soundcloud.com/#{$3}/#{$4}&show_artwork=#{show_artwork}&show_comments=#{show_comments}&auto_play=#{auto_play}&color=#{color}&theme_color=#{theme_color}"

    "<iframe width='#{width}' height='#{height}' scrolling='no' frameborder='no' src='#{url}'></iframe>"
  end
end
