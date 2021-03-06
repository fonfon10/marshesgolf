ActiveAdmin.register Member do
  permit_params :email, :password, :password_confirmation, :age_group_id, :membership_id, :lesson

  index do
    selectable_column
    id_column

    column :firstname
    column :lastname
    column :email
    column :age_group
    column :membership
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :lastname
  filter :age_group
  filter :email
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :age_group
      f.input :membership
      f.input :lesson
    end
    f.actions
  end

end
