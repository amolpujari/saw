class TrackVisit < ActiveRecord::Base
  default_scope order('id')

  attr_accessible :user_id, :session_id, :remote_ip, :user_agent, :visit_source

  has_many :track_links, :dependent => :destroy
  belongs_to :user

  def title
    user_name = ''

    %w(name first_name username email).each do |attr|
      if user.respond_to? attr
        user_name = user.send attr
        break
      end
    end

    "#{user_name}(#{lasts}) on #{created_at.strftime('%b %-d %Y, %l %P')}"
  end

  def starts_with
    track_links.first
  end

  def ends_with
    track_links.last
  end

  def lasts
    Saw::Util.time_diff created_at, ends_with.created_at if ends_with
  end
end
