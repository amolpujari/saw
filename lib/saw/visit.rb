class Visit < ActiveRecord::Base
  has_many :hits, :dependent => :destroy
  belongs_to :user

  def title
    return unless user

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
    hits.first
  end

  def ends_with
    hits.last
  end

  def lasts
    Saw::Util.time_diff created_at, ends_with.created_at if ends_with
  end
end
