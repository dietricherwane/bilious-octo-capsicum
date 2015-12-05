class AddPublicationDateToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :publication_date, :date
  end
end
