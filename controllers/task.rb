class TaskController < ApplicationController

  #read (list)
  get '/' do
    @tasks=Task.all
    # 1. get a list of all task models
    # and set it to the @tasks variable

    # return view
    erb :read
  end#this is done!

  #create
  get '/create' do

    # return view
    erb :create
  end# we didnt need to add anything to the get /create
  post '/create' do
    p params
    @task=Task.new
    @task.name = params[:name]
    @task.description = params[:desc]
    @task.save
    # 2. Check the `params` hash and
    # the create view. Notice the keys
    # being passed in along with the values.
    # Take these values and create a *new*
    # instance of your Task model.
    # Assign it to a variable called @task
    # update the attributes withn the values
    # from params. Then save it!

    # return view
    @message = 'Your task was added!'
    erb :message
  end #we did it! this is done

  #update
  get '/update/:id' do
    p params
    @task = Task.find(params[:id])

    # 3. We should be getting params[:id]
    # here. Let's find our model and return it.
    # Since we know the `id` of the model, we
    # should have no problem finding it?
    # Assign it the @task instance variable.
    # This view will not render until the code works.

    # return view
    erb :update
  end
  post '/update' do
    p params

    @task = Task.find(params[:id])
    @task.id = params[:id]
    @task.name = params[:name]
    @task.description = params[:desc]
    @task.save

    # 4. Just like create, we need to find our model.
    # Then update the attributes and save it!
    # Let's assing our model to the task.
    # Shhh... we've used a *hidden* input on the :create
    # view to hold the id. This is so users can't try
    # to edit it! Sneaky, sneaky.

    # return view
    @message = 'Your task was updated!'
    erb :message
  end

  #destroy
  get '/destroy/:id' do
    p params
    @task = Task.find(params[:id])
    # 5. We should be getting params[:id]
    # here. Let's find our model and return it.
    # Since we know the `id` of the model, we
    # should have no problem finding it?
    # We need it for our view.

    # return view
    erb :destroy
  end
  post '/destroy' do
    p params

    @task = Task.find(params[:id])
    @task.destroy

    # 6. We should be getting params[:id]
    # here. Let's find our model and return it.
    # Since we know the `id` of the model, we
    # should have no problem finding it?
    # Then, we just need to remove it from
    # our database table.

    # return view
    @message = 'BOOM! Destroyed.'
    erb :message
  end


end
