class AddSliderFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_slider_slide1_text1, :string
    add_column :en_front_page_contents, :home_slider_slide1_text2, :string
    add_column :en_front_page_contents, :home_slider_slide1_text3, :string
    add_column :en_front_page_contents, :home_slider_slide2_text1, :string
    add_column :en_front_page_contents, :home_slider_slide2_text2, :string
    add_column :en_front_page_contents, :home_slider_slide2_text3, :string
    add_column :en_front_page_contents, :home_slider_slide2_text4, :string
    add_column :en_front_page_contents, :home_slider_slide2_text5, :string
    add_column :en_front_page_contents, :home_slider_slide2_text6, :string
    add_column :en_front_page_contents, :home_slider_slide3_text1, :string
    add_column :en_front_page_contents, :home_slider_slide3_text2, :string
    add_column :en_front_page_contents, :home_slider_slide3_text3, :string
    add_column :en_front_page_contents, :home_slider_slide3_text4, :string
    add_column :en_front_page_contents, :home_slider_slide4_text1, :string
    add_column :en_front_page_contents, :home_slider_slide4_text2, :string
    add_column :en_front_page_contents, :home_slider_slide4_text3, :string
    add_column :en_front_page_contents, :home_slider_slide4_text4, :string
    add_column :en_front_page_contents, :home_slider_slide4_text5, :string
  end
end
