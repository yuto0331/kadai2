class ContactMailer < ApplicationMailer
    def contact_mail(blog)
        @blog = blog
        @user = @blog.user.email
        
        mail to: @user, subject: "お問い合わせ確認メール"
    end
end
