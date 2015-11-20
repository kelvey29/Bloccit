module UsersHelper
    def comments_posts_related_to_user
        current_user.posts.empty?
    end
end
