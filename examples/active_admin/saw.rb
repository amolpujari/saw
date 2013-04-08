ActiveAdmin.register Visit do
  menu :parent => "Users"
  belongs_to :user, :optional => true

  actions :index, :show, :destroy

  index do
    selectable_column

    column :note do |resource|
      resource.hits.first.note.html_safe
    end

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
  belongs_to :visit, :optional => true

  actions :index, :show, :destroy

  index do
    selectable_column
    column "Time", :sortable => :created_at do |resource|
      resource.created_at.strftime('%T %Z')
    end
    column :note do |resource|
      resource.note.html_safe
    end
    
    default_actions
  end
end
