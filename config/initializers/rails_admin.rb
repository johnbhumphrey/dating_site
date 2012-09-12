# RailsAdmin config file. Generated on September 12, 2012 13:26
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, Throwaway

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Throwaway

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Dating', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # config.authenticate_with do
  #   authenticate_admin
  # end  

  config.authorize_with do
    redirect_to main_app.root_path, flash: { error: "Access denied" } unless current_user.admin?
  end  
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  config.excluded_models = [Forem::Category, Forem::Forum, Forem::Group, Forem::Membership, Forem::ModeratorGroup, Forem::Post, Forem::Subscription, Forem::Topic, Forem::View]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Announcement, Blog, Favorite, Forem::Category, Forem::Forum, Forem::Group, Forem::Membership, Forem::ModeratorGroup, Forem::Post, Forem::Subscription, Forem::Topic, Forem::View, Hidden, Photo, PrivateMessage, Profile, Search, User, View, Wink]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Announcement do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :starts_at, :datetime 
  #     configure :ends_at, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :body, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Blog do
  #   # Found associations:
  #     configure :user, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :body, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Favorite do
  #   # Found associations:
  #     configure :favoriter, :belongs_to_association 
  #     configure :favoritee, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :favoriter_id, :integer         # Hidden 
  #     configure :favoritee_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Category do
  #   # Found associations:
  #     configure :forums, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :slug, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Forum do
  #   # Found associations:
  #     configure :category, :belongs_to_association 
  #     configure :views, :has_many_association 
  #     configure :topics, :has_many_association 
  #     configure :posts, :has_many_association 
  #     configure :moderators, :has_many_association 
  #     configure :moderator_groups, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :description, :text 
  #     configure :category_id, :integer         # Hidden 
  #     configure :views_count, :integer 
  #     configure :slug, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Group do
  #   # Found associations:
  #     configure :memberships, :has_many_association 
  #     configure :members, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Membership do
  #   # Found associations:
  #     configure :group, :belongs_to_association 
  #     configure :member, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :group_id, :integer         # Hidden 
  #     configure :member_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::ModeratorGroup do
  #   # Found associations:
  #     configure :forum, :belongs_to_association 
  #     configure :group, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :forum_id, :integer         # Hidden 
  #     configure :group_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Post do
  #   # Found associations:
  #     configure :topic, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :reply_to, :belongs_to_association 
  #     configure :replies, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :topic_id, :integer         # Hidden 
  #     configure :text, :text 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :reply_to_id, :integer         # Hidden 
  #     configure :state, :string 
  #     configure :notified, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Subscription do
  #   # Found associations:
  #     configure :subscriber, :belongs_to_association 
  #     configure :topic, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :subscriber_id, :integer         # Hidden 
  #     configure :topic_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::Topic do
  #   # Found associations:
  #     configure :forum, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :views, :has_many_association 
  #     configure :subscriptions, :has_many_association 
  #     configure :posts, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :forum_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :subject, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :locked, :boolean 
  #     configure :pinned, :boolean 
  #     configure :hidden, :boolean 
  #     configure :last_post_at, :datetime 
  #     configure :state, :string 
  #     configure :views_count, :integer 
  #     configure :slug, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Forem::View do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :viewable, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :viewable_id, :integer         # Hidden 
  #     configure :viewable_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :count, :integer 
  #     configure :current_viewed_at, :datetime 
  #     configure :past_viewed_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Hidden do
  #   # Found associations:
  #     configure :sender, :belongs_to_association 
  #     configure :receiver, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :sender_id, :integer         # Hidden 
  #     configure :receiver_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Photo do
  #   # Found associations:
  #     configure :profile, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :profile_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :caption, :text 
  #     configure :primary, :boolean 
  #     configure :avatar_file_name, :string         # Hidden 
  #     configure :avatar_content_type, :string         # Hidden 
  #     configure :avatar_file_size, :integer         # Hidden 
  #     configure :avatar_updated_at, :datetime         # Hidden 
  #     configure :avatar, :paperclip   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model PrivateMessage do
  #   # Found associations:
  #     configure :sender, :belongs_to_association 
  #     configure :receiver, :belongs_to_association 
  #     configure :conversation, :belongs_to_association 
  #     configure :replies, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :body, :text 
  #     configure :read_at, :datetime 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :sender_id, :integer         # Hidden 
  #     configure :receiver_id, :integer         # Hidden 
  #     configure :conversation_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Profile do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :photos, :has_many_association 
  #     configure :sent_messages, :has_many_association 
  #     configure :received_messages, :has_many_association 
  #     configure :sent_winks, :has_many_association 
  #     configure :received_winks, :has_many_association 
  #     configure :favorites, :has_many_association 
  #     configure :favorited_by, :has_many_association 
  #     configure :views, :has_many_association 
  #     configure :reverse_views, :has_many_association 
  #     configure :viewed_profiles, :has_many_association 
  #     configure :viewed_by, :has_many_association 
  #     configure :searches, :has_many_association 
  #     configure :hidden_profiles, :has_many_association 
  #     configure :reverse_hidden_profiles, :has_many_association 
  #     configure :profiles_hidden, :has_many_association 
  #     configure :profiles_hidden_by, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :about_me, :text 
  #     configure :message_me_if, :text 
  #     configure :good_at, :text 
  #     configure :relationship_status, :string 
  #     configure :age, :integer 
  #     configure :sex, :string 
  #     configure :location, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :body_type, :string 
  #     configure :height, :integer 
  #     configure :ethnicity, :string 
  #     configure :smokes, :string 
  #     configure :drinks, :string 
  #     configure :religion, :string 
  #     configure :income, :string 
  #     configure :job, :string 
  #     configure :language, :string 
  #     configure :drugs, :string 
  #     configure :offspring, :string 
  #     configure :exercise, :string 
  #     configure :zip_code, :integer 
  #     configure :nick_name, :string 
  #     configure :interested_in, :string 
  #     configure :zipcode, :string 
  #     configure :formatted_height, :string 
  #     configure :avatar_file_name, :string 
  #     configure :avatar_content_type, :string 
  #     configure :avatar_file_size, :integer 
  #     configure :avatar_updated_at, :datetime 
  #     configure :hidden, :boolean 
  #     configure :new_user, :boolean 
  #     configure :photos_count, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Search do
  #   # Found associations:
  #     configure :profile, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :keywords, :string 
  #     configure :min_age, :integer 
  #     configure :max_age, :integer 
  #     configure :min_height, :integer 
  #     configure :max_height, :integer 
  #     configure :sex, :string 
  #     configure :relationship_status, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :interested_in, :string 
  #     configure :save_search, :boolean 
  #     configure :profile_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :profile, :has_one_association 
  #     configure :blogs, :has_many_association 
  #     configure :forem_posts, :has_many_association 
  #     configure :forem_topics, :has_many_association 
  #     configure :forem_memberships, :has_many_association 
  #     configure :forem_groups, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :password_digest, :string 
  #     configure :email, :string 
  #     configure :admin, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :nick_name, :string 
  #     configure :remember_token, :string 
  #     configure :forem_admin, :boolean 
  #     configure :forem_state, :string 
  #     configure :forem_auto_subscribe, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model View do
  #   # Found associations:
  #     configure :viewer, :belongs_to_association 
  #     configure :viewed, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :viewer_id, :integer         # Hidden 
  #     configure :viewed_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Wink do
  #   # Found associations:
  #     configure :sender, :belongs_to_association 
  #     configure :receiver, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :sender_id, :integer         # Hidden 
  #     configure :receiver_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
