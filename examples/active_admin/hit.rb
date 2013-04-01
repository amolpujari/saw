ActiveAdmin.register Hit do
  menu :parent => "Users"
  belongs_to :visit, :optional => true

  actions :all, :except => [:edit, :update]

  index do
    selectable_column
    column :note

    column :action, :sortable => :action do |resource|
      "#{resource.http_method} #{resource.action}"
    end 

    column "" do |resource|
      links = ''
      links << (link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link view_link")
      links << (link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link")
      links.html_safe
    end
  end
end
