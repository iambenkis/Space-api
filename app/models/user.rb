class User < ApplicationRecord
    has_secure_password 
    has_many :missions
    has_many :rockets
    has_many :reserveds
    validates :name, presence: true, uniqueness: true , length: { in: 4..45 }
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }

    Roles = %i[admin user].freeze

    def is?(request_role)
        role == request_role.to_s
    end
end
