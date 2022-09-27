class CorrectSpellingOfTranslator < ActiveRecord::Migration[5.2]
  def change
    rename_column :authorships, :translatior, :translator
  end
end
