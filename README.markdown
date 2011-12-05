# Hi, Welcome to Rails on Campus.

This is the sample code from **Lab #3** - the final session. Hopefully you had a chance to 
work on this in class and have your own version. This is the sample code that is meant
to go along with the lecture. Please be sure to start with [Lab #1](https://github.com/kudelabs/roc-lab1), 
and use the NOTES to follow along.

### Topics covered in this Lab include:

+ User sessions - `session[:user_id]`
+ Before filters - `before_filter :require_login` 
+ Form tag helpers - `form_tag`, `text_field_tag`
+ Custom routes - `match 'login' => 'sessions#new'`

### Versions used for this code:

+ Rails 3.1.1
+ ruby 1.9.2
+ see Gemfile for more information

### Instructions:

+ download the code <https://github.com/kudelabs/roc-lab3> either with git or as a zip file  
        $ cd roc-lab3
        $ bundle install  
        $ rake db:migrate  
        $ rails server  
+ Goto <http://localhost:3000>
+ Be sure to see NOTES for more commands and tips.


### Additional resources:

+ Rails for Windows: http://Railsinstaller.org
+ Slides: 
+ Rails Documentation: http://guides.rubyonrails.org/getting_started.html
+ Lab #1: https://github.com/kudelabs/roc-lab1
+ Lab #2: https://github.com/kudelabs/roc-lab2

---

Rails on Campus is a program started by Leon Du and Shaokun Wu, 2 ruby developers 
in Guangzhou, China. The idea is to build material for introductory
courses that can be used to teach Rails on college campuses. College students are 
often not exposed to newer technology, and are left to learn on the job. The goal 
of this program is to introduce students to the world of open source development 
frameworks to help prepare them for a good job.

Rails on Campus is sponsored by:

+ gzruby - The Guangzhou Ruby Group http://groups.google.com/group/gzruby
+ Kudelabs http://kudelabs.com
+ Beansmile http://beansmile.com 

