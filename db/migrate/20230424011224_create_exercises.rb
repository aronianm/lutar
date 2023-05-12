class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    file = File.read('workout.json')
    data_hash = JSON.parse(file)
    create_table :exercises, force: true do |t|
      t.string :name
      t.string :level
      t.string :muscle
      t.timestamps
    end
    data_hash.each do |d|
      obj = d.reject{|k,v| ['equipment', 'previewSrc', 'previewSrcDims', 'videoLink', 'id'].include?(k)}
      Exercise.create(obj)
    end

  end
end
