ActiveAdmin.register User do
    permit_params :userid, :password, :password_confirmation
  
    index do
      selectable_column
      id_column
      column :userid
      column :plaintext_password
      actions
    end
  
    filter :userid
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :userid
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
  
  end
  