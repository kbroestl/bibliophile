class Authorship < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  
  def is_translator?
    self.translator == 1
  end
  
  def is_editor?
    self.editor == 1
  end
  
end
