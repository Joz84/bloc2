ActiveAdmin.register User do

  actions :index, :new, :create, :update, :edit
  permit_params :sex,
                :country,
                :first_name,
                :last_name,
                :phone,
                :email,
                :birthday


  index do
    selectable_column
    column :id
    column :sex
    column :country
    column :first_name
    column :last_name
    column :phone
    column :birthday
    actions
  end

  form do |f|
    f.inputs "Infos de base" do
        f.input :email
        if f.object.new_record?
            f.input :password
            f.input :password_confirmation
        end
        f.input :sex
        f.input :country
        f.input :first_name
        f.input :last_name
        f.input :phone
        f.input :birthday
    end
    actions
  end

  filter :sex
  filter :country
  filter :first_name
  filter :last_name
  filter :phone
  filter :email
  filter :birthday
end
