class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.user_email(@contact).deliver_now
      ContactMailer.admin_email(@contact).deliver_now
      redirect_to root_path, notice: "送信しました"
    else
      render :index, notice: "送信できませんでした"
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:name, :email, :content, :submitted, :confirmed)
          .merge(remote_ip: request.remote_ip)
  end
end
