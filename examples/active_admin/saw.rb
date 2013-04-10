ActiveAdmin.register Visit do
  menu :parent => "Users"
  belongs_to :user, :optional => true
  actions :index, :show, :destroy

  index do
    selectable_column

    column :note do |resource|
      resource.hits.first.note.html_safe
    end

    column :user
    column :hits do |resource|
      link_to("#{resource.hits.count}", admin_visit_hits_path(resource))
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

  filter :user_username, :as => :string
  filter :user_agent
  filter :remote_host
  filter :created_at
end

ActiveAdmin.register Hit do
  menu false
  belongs_to :visit, :optional => true
  actions :index, :show

  index do
    selectable_column
    column :after
    column :note do |resource|
      resource.note.html_safe
    end
    default_actions
  end

  filter :note
  filter :visit, :as => :select, :collection => proc { params[:visit_id] ? Visit.find(params[:visit_id]).user.visits : Visit.scoped }
  filter :url
  filter :created_at
end
