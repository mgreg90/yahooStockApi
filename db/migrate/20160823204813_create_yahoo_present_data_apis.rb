class CreateYahooPresentDataApis < ActiveRecord::Migration[5.0]
  def change
    create_table :yahoo_present_data_apis do |t|

      t.timestamps
    end
  end
end
