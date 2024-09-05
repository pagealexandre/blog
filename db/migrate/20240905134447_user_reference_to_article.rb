class UserReferenceToArticle < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :user, index: true
  end
end
