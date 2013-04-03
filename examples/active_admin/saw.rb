ActiveAdmin.register Visit do
  menu :parent => "Users"
  belongs_to :user, :optional => true

  actions :all, :except => [:edit, :update, :create]

  index do
    selectable_column

    column "" do |resource|
      links = ''
      links << link_to("#{resource.hits.count} hits", admin_visit_hits_path(resource))
      links << " by "
      links << link_to("#{resource.user.username}", admin_user_path(resource.user))
      links.html_safe
    end

    column :user_agent
    column :remote_host

    column :starting, :sortable => :created_at do |resource|
      resource.created_at.strftime('%b %-d %Y, %l %P')
    end
    column :lasts do |resource|
      resource.lasts
    end

    default_actions
  end
end

ActiveAdmin.register Hit do
  menu :parent => "Users"
  belongs_to :visit, :optional => true

  actions :all, :except => [:edit, :update, :create]

  index do
    selectable_column
    column :note

    column :action, :sortable => :action do |resource|
      "#{resource.http_method} #{resource.action}"
    end 

    default_actions
  end
end
