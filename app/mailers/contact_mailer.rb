class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    mail to: "hitomi.kanaya08@gmail.com", subject: "投稿確認メールです"
  end
end
