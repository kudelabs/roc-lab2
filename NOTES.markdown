# Hi, this is STEP BY STEP to make ROC-LAB3 from ROC-LAB2.

###  Getting started
Start from your own version of roc-lab2, or get it from the repo:
 git clone git://github.com/kudelabs/roc-lab2.git


### 1.  add user model, add relationships to messages, and replies.

+ $ rails generate model user name:string email:string  password:string

+ $ rails generate migration add_user_to_messages_and_replies

+ add following two lines to the newly created migration file:
 
        add_column :messages, :user_id, :integer
        add_column :replies, :user_id, :integer

+ add associations:
+ 
        in user model => has_many :messages, :replies
        in message and reply models => belongs_to :user

+ rake db:migrate


### 2. play with the new user in rails console
+ $ rails console
+ $ user = User.create(:name=>'adeh',:email=>"adeh@kudelabs.com",:password=>'test')
+ $ msg = user.messages.create(:body=>'hellow haha')
+ $ reply = msg.replies.create(:body=>"reply to myself")
+ $ reply.user = user
+ $ reply

### 3. edit views, replace placeholder "someone" to be real users
start server and then go to see the effect from console.

### 4.  create user, sessions controllers
+ $ rails generate controller users new
+ $ rails generate controller sessions new

and  add before_filter :require_logged_in

### 5. add routes:
+ match 'login' => "sessions#new"
+ match 'logout' => "sessions#destroy"
+ match 'signup' => "users#new"

### 6.  finish up sessions#new, user#new and then sessions#destroy

    <%=form_tag sessions_path do%>
        <p>
          Name: <%=text_field_tag :name%>
        </p>

        <p>
          Password: <%=password_field_tag :password%>
        </p>

        <%=submit_tag "Login"%>
    <%end%>

### 7. update message#create, reply#create to add user association.

    message.user = current_user
    reply.user = current_user

