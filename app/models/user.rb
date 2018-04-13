class User < ApplicationRecord

    def full_name
        reversed_name
    end
    # @user.full_name

    private

    def reversed_name
        email + " " + username
    end
end
