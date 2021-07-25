class ContactMailer < ApplicationMailer
  ADMIN_EMAIL = "admin@example.com".freeze

  def user_email(contact)
    @contact = contact
    @name = contact.name.presence || contact.email
    subject = "【不健康レシピ】お問い合わせを受付いたしました"

    mail(to: contact.email, subject: subject)
  end

  def admin_email(contact)
    @contact = contact
    @name = contact.name.presence || contact.email
    subject = "【不健康レシピ】お問い合わせがありました"

    mail(to: ADMIN_EMAIL, subject: subject)
  end
end
