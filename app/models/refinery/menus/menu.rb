module Refinery
  module Menus
    class Menu < Refinery::Core::BaseModel
      serialize :links, Hash

      before_validation :add_permatitle

      self.table_name = "refinery_menus"

      has_many :links, -> { order('lft ASC') }, class_name: 'Refinery::Menus::MenuLink', foreign_key: :refinery_menu_id, dependent: :destroy
      accepts_nested_attributes_for :links

      validates :title, :presence => true, :uniqueness => true
      validates :permatitle, :presence => true, :uniqueness => true
      validates_associated :links

      def roots
        @roots ||= links.select { |pos| pos.parent_id.nil? }
      end

      def attributes
        [:title, :parent_id, :lft, :rgt, :depth, :url, :menu, :menu_match, :html]
      end

      private

      def add_permatitle
        unless permatitle.present?
          self.permatitle = self&.title.gsub(' ', '_').underscore
        end
      end
    end
  end
end
