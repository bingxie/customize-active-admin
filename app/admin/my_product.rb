ActiveAdmin.register Product, :namespace => "my" do

  menu false
  #menu :label => "My Posts"
  #scope_to :current_user  #access: current_user.posts.
  
  # controller do
  #   def resource
  #     Product.first
  #   end
  # end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :name, :price, :released_at, :status

  index do
    selectable_column

    column :name
    column :price
    column :released_at
    column :status do |product|
      status_tag(product.status, :ok)
    end

    default_actions
  end

  index :as => :grid, :column => 5 do |product|
    link_to product.name, admin_product_path(product)
  end

  #fully customize the display of your resources on the index screen
  #Index as a Block
  index :as => :block do |product|
    div :for => product do
      h2 auto_link(product.name)
      div do
        simple_format product.name
      end
    end
  end
  

  filter :name
  filter :price
  filter :released_at
end
