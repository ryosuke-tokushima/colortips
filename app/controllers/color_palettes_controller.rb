class ColorPalettesController < ApplicationController
  require 'rest-client'
  require 'base64'
  require 'json'
  require 'mini_magick'
  require 'image_analyzer'

  def analyze
    image_path = params[:image_path].path
    result_data = ImageAnalyzer.analyze(image_path)

    if result_data[:error]
      flash[:alert] = result_data[:error]
      redirect_to new_color_palette_path
    else
      @result = result_data[:result]
      @image_data = result_data[:image_data]
    end
  end

  def create
    # カラーパレットを作成する
    @color_palette = current_user.color_palettes.build(color_palette_params)
    if @color_palette.save
      selected_colors = params[:color_palette][:colors]
      colors = []

      # トランザクション追加
      ActiveRecord::Base.transaction do
        colors = selected_colors.map do |selected_color|
          closest_palette_color, closest_palette_color_html_code = selected_color.split('|')
          color = Color.find_or_create_by(closest_palette_color: closest_palette_color,
                                          closest_palette_color_html_code: closest_palette_color_html_code)
        end

        colors.each do |color|
          ColorPaletteColor.create!(color_palette: @color_palette, color: color)
        end
      end

      # リダイレクトする
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def delete
    @color_palette = ColorPalette.find(params[:id])
    @color_palette.destroy!
    redirect_to user_url(current_user)
  end

  def new; end

  def show; end

  def index; end

  private

  def color_palette_params
    params.permit(:color_palette_title)
  end
end
