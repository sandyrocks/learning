class Users::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  def index
    @contacts = Contact.all
    respond_with @contacts
  end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save 
      redirect_to users_contact_path(@contact)
    else
      render 'new' 
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def destory 
    @contact.destroy 
    redirect_to users_contacts_path
  end 

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit( 
        :first_name, 
        :last_name, 
        :email, 
        :age, 
        :city,
        :state, 
        :dob, 
        :mobile_number,
        :landline_number
      )
    end

end
