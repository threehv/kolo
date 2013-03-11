module Kolo
  module Icons
    def show_icon_called name, extra_classes = ''
      "<i class='#{name} #{extra_classes}'></i>".html_safe
    end

    def add_icon extra_classes = ''
      show_icon_called 'icon-plus-sign', extra_classes
    end

    def edit_icon extra_classes = ''
      show_icon_called 'icon-edit', extra_classes
    end

    def remove_icon extra_classes = ''
      show_icon_called 'icon-remove-sign', extra_classes
    end

    def go_icon extra_classes = ''
      show_icon_called 'icon-play', extra_classes
    end

    def select_all_icon extra_classes = ''
      show_icon_called 'icon-ok-circle', extra_classes
    end

    def deselect_all_icon extra_classes = ''
      show_icon_called 'icon-remove-circle', extra_classes
    end

    def basket_icon extra_classes = ''
      show_icon_called 'icon-shopping-cart', extra_classes
    end

    def export_icon extra_classes = ''
      show_icon_called 'icon-share', extra_classes
    end

    def options_icon extra_classes = ''
      show_icon_called 'icon-cog', extra_classes
    end

    def parent_icon extra_classes = ''
      show_icon_called 'icon-eject', extra_classes
    end

    def image_icon extra_classes = ''
      show_icon_called 'icon-picture', extra_classes
    end

    def duplicate_icon extra_classes = ''
      show_icon_called 'icon-retweet', extra_classes
    end

    def tabs_icon extra_classes = ''
      show_icon_called 'icon-th-list', extra_classes
    end

    def field_definitions_icon extra_classes = ''
      show_icon_called 'icon-tags', extra_classes
    end

    def user_icon extra_classes = ''
     show_icon_called 'icon-user', extra_classes
    end

    def csv_icon extra_classes = ''
     show_icon_called 'icon-list-alt', extra_classes
    end

  end
end
