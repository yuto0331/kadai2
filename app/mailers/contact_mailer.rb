class ContactMailer < ApplicationMailer
    def contact_mail(blog)
        @blog = blog
        @user = @blog.user.email
        
        mail to: "@user", subject: "作成完了メール"
    end
end
