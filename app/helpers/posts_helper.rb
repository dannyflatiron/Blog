module PostsHelper

    def index_display_header
        if @user 
            content_tag(:h1, "#{@user.username}'s Posts:")
        else 
            content_tag(:h2, "All Posts")
        end 
    end
    
end
