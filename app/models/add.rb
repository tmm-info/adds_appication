class Add < ApplicationRecord
  include PgSearch::Model
  scope :sorted, ->{ order(body: :asc) }

  pg_search_scope :search_by_add,
                  against: [
                    :title,
                    :body
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      negation: true,
                      highlight: {
                        start_sel: '<b>',
                        stop_sel: '</b>',
                      }
                    }
                  }
  belongs_to :user
  has_many :comments
  mount_uploader :img, ImageUploader
  def identifier
    [title, body].join " "
  end
end
