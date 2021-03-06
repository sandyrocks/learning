class Users::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @contacts = Contact.all
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
    if @contact.update(contact_params)
      redirect_to users_contact_path(@contact)
    else
      render 'edit'
    end
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
