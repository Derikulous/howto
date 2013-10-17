## Create a HowTo List

By Derik Strattan
Rails version 4.0
Based on [Tutorial][2] by [jhjguxin](https://gist.github.com/jhjguxin)
Based on the tutorial from [jhjguxin](https://gist.github.com/jhjguxin/3074080)

##Description

A simple "How-To" Site that explores the nested resources and how to route between them
##Instructions Key

    Change PARENT, CHILD, PROJECT_NAME to whatever you want to call them (DO NOT USE DEFAULT)
    _B_ means B is capitalized
    Be EXTRA careful of "s"
    + means add the code
    - means delete it

##Instructions
Create Brand New Rails App

$ rails _3.2.14_ new PROJECT_NAME --skip-test-framework

Generate PARENT and CHILD scaffolds

$ rails generate scaffold PARENT title description:text --skip-test-framework
$ rails generate scaffold CHILD title description:text PARENT_id:integer --skip-test-framework

###Migrate your database

$ rake db:migrate

Add PARENT and CHILD relationship

# in file app/models/PARENT.rb
class PARENT < ActiveRecord::Base
+ has_many :CHILDs

# in file app/models/CHILD.rb
class CHILD < ActiveRecord::Base
+ belongs_to :PARENT

# in file config/routes.rb
PROJECT_NAME::Application.routes.draw do
+ root :to =>"PARENT#index"
- resources :PARENT
- resources :CHILD
+ resources :PARENT do
+  resources :CHILD
+ end

Modify CHILD controllers

# in file app/controllers/CHILD_controller.rb
class CHILDController < ApplicationController
+ before_filter :load_PARENT
def index
- @CHILDs = _C_HILD.all
+ @CHILDs = @PARENT.CHILDs.all

def show
- @CHILD = _C_HILD.find(params[:id])
+ @CHILD = @PARENT.CHILDs.find(params[:id])

def new
- @CHILD = _C_HILD.new
+ @CHILD = @PARENT.CHILDs.new

def edit
- @CHILD = _C_HILD.find(params[:id])
+ @CHILD = @PARENT.CHILDs.find(params[:id])

def create
- @CHILD = _C_HILD.new(params[:CHILD])
+ @CHILD = @PARENT.CHILDs.new(params[:CHILD])

- format.html { redirect_to @CHILD, notice: '_C_HILD was successfully created.' }
+ format.html { redirect_to [@PARENT, @CHILD], notice: '_C_HILD was successfully created.' }

def destroy
- @CHILD = _C_HILD.find(params[:id])
+ @CHILD = @PARENT.CHILDs.find(params[:id])

- format.html { redirect_to CHILDs_url }
+ format.html { redirect_to PARENT_CHILDs_path(@PARENT) }

+ private
+  def load_PARENT
+    @PARENT = _P_ARENT.find(params[:PARENT_id])
+  end

Modify CHILD views

# in file app/views/CHILDs/_form.html.erb
- <%= form_for(@CHILD) do |f| %>
+ <%= form_for([@PARENT, @CHILD]) do |f| %>

# in file app/views/CHILDs/edit.html.erb
- <%= link_to 'Show', @CHILD %> |
- <%= link_to 'Back', CHILDs_path %>
+ <%= link_to 'Show', PARENT_CHILD_path(@PARENT, @CHILD) %> |
+ <%= link_to 'Back', PARENT_CHILDs_path(@PARENT) %>

# in file app/views/CHILDs/index.html.erb
- <td><%= link_to 'Show', CHILD %></td>
- <td><%= link_to 'Edit', edit_CHILD_path(CHILD) %></td>
- <td><%= link_to 'Destroy', CHILD, method: :delete, data: { confirm: 'Are you sure?' } %></td>
+ <td><%= link_to 'Show', PARENT_CHILD_path(@PARENT, CHILD) %></td>
+ <td><%= link_to 'Edit', edit_PARENT_CHILD_path(@PARENT, CHILD) %></td>
+ <td><%= link_to 'Destroy', [@PARENT, CHILD], method: :delete, data: { confirm: 'Are you sure?' } %></td>

- <%= link_to 'New _C_HILD', new_CHILD_path %>
+ <%= link_to 'New _C_HILD', new_PARENT_CHILD_path(@PARENT) %>

# in file app/views/CHILDs/new.html.erb
- <%= link_to 'Back', CHILDs_path %>
+ <%= link_to 'Back', PARENT_CHILDs_path(@PARENT) %>

# in file app/views/CHILDs/show.html.erb
- <%= link_to 'Edit', edit_CHILD_path(@CHILD) %> |
- <%= link_to 'Back', CHILDs_path %>
+ <%= link_to 'Edit', edit_PARENT_CHILD_path(@PARENT, @CHILD) %> |
+ <%= link_to 'Back', PARENT_CHILDs_path(@PARENT) %>

You should have a basic barebone nested rails app at this point.

Feel free to customize the views in any way you would like
Further Reading

    Ruby on Rails Guide to Routing specifically 2.7 Nested Resources
    Tutorial on Creating Nested Resource by jhjguxin
