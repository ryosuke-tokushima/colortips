class ColorPalettesController < ApplicationController
require 'rest-client'
require 'base64'
require 'json'

    def analyze
     image_path = params[:image_path].path
     api_key = ENV['API_KEY']
     api_secret = ENV['API_SECRET']

     auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
     response = RestClient.post "https://api.imagga.com/v2/colors?overall_count=10&extract_object_colors=0", { :image => File.new(image_path, 'rb') }, { :Authorization => "Basic YWNjXzA1NjE5ZTllYzkxNzlkMDo3ZjY2MGMwYzBhNzk4YWY4MzgwNTc2ZTAwZDA1MjZiZg==" }
     @result = JSON.parse(response)
     @image_data = Base64.encode64(params[:image_path].read)

    end

    def create
      # カラーパレットを作成する
      @color_palette = current_user.color_palettes.build(color_palette_params)
      if @color_palette.save
        selected_colors = params[:color_palette][:colors]
        colors = []
        selected_colors.each do |selected_color|
          closest_palette_color, closest_palette_color_html_code = selected_color.split('|')
          color = Color.find_or_create_by(closest_palette_color: closest_palette_color, closest_palette_color_html_code: closest_palette_color_html_code)
          colors << color
        end
      
        colors.each do |color|
          ColorPaletteColor.create(color_palette: @color_palette, color: color)
        end
        # リダイレクトする
        redirect_to user_path(current_user)
      else
        render :new
      end
    end

    def new
    end

    def show
    end
    
    def index
    end

    private

    def color_palette_params
     params.permit(:color_palette_title)
    end
end
