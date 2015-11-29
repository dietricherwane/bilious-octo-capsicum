class AddContactFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :contact_main_content_title, :string
    add_column :en_front_page_contents, :contact_main_content_intro_text, :text
    add_column :en_front_page_contents, :contact_main_content_detailed_contacts, :text
    add_column :en_front_page_contents, :contact_main_content_form_field_name, :string
    add_column :en_front_page_contents, :contact_main_content_form_field_email, :string
    add_column :en_front_page_contents, :contact_main_content_form_field_subject, :string
    add_column :en_front_page_contents, :contact_main_content_form_field_message, :text
    add_column :en_front_page_contents, :contact_main_content_form_field_validation_button, :string
  end
end
