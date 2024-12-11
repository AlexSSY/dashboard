class User < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_one_attached :avatar

  validates_presence_of :username
  validates_uniqueness_of :username

  def full_name
    [ first_name, last_name ].join " "
  end

  def avatar_url
    avatar.attached? ? url_for(avatar) : "/user.png"
  end

  def self.list_columns
    [
      { field: :id, name: :ID },
      { field: :username, name: "User Name" },
      { field: :first_name, name: "First Name" },
      { field: :last_name, name: "Last Name" }
    ]
  end

  def self.lnk_column
    :username
  end

  def self.form_fields
    {
      username: { type: :string, label: "Username", required: true },
      first_name: { type: :string, label: "First Name" },
      last_name: { type: :select, label: "Last Name" }
    }
  end
end
