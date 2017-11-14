authorization do
 
  role :user do
    has_permission_on :articles, :to => [:read, :create]
    has_permission_on :articles, :to => [:update, :delete] do
       if_attribute :user_id => is {user.id}
    end
    has_permission_on :comments, :to => [:read, :create]
    has_permission_on :comments, :to => [:update, :delete] do

       if_attribute :user_id => is {user.id}
     end
   end
  role :guest do
    # add permissions for guests here, e.g.
    has_permission_on :articles, :to => :read
    has_permission_on :comments, :to => :read
  end
  
  # permissions on other roles, such as
  
   role :admin do
     has_permission_on :articles, :to => :manage
     has_permission_on :comments, :to => :manage
  end
  # See the readme or GitHub for more examples
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
