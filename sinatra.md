# Student Sinata App: Part Zero

## Objective

Get comfortable writing routes and creating ERB views in a very simple Sinatra App.

## Tutorial

### Part 1: Bootstrap the app

1) Fork the student-sinatra-app repository at [https://github.com/ashleygwilliams/student-sinatra](https://github.com/ashleygwilliams/student-sinatra)

2) Clone the repository locally.


### Part 2: Setup Views

1) By default, Sinatra your templates are located in a directory called `views` in the root of your project. This is where you will put your ERB templates.

N.B. To use a different views directory: set `:views, settings.root + '/templates'`

[http://www.sinatrarb.com/intro.html#Views%20/%20Templates](http://www.sinatrarb.com/intro.html#Views%20/%20Templates)

2) Create a folder called `views` in the root of your project folder. Inside this, create a file called `hello.erb`. Give it the content `Hello World!`

### Part 3: Routes

We are going to create some routes to our app. In a Sinatra application, the route and the [controller](https://en.wikipedia.org/wiki/Model%E2%80%93View%E2%80%93Controller) are defined in the same place, but for our purposes we will just refer to them as routes. This places is app.rb.

Routes in Sinatra look like this

```ruby
request_type "/Path" do
  erb :name_of_template
end
```
For example:
```ruby
#in response to a get request to http://www.mydomain.com/users/1
#render the template show.erb

#app.rb
get "/users/1" do
   erb :show
end
```

For our first route, we are going to define a path at `/hello-world` to render our `hello.erb` view at. To do this:

1) We start with the request type. We will be using `get`.

2) Next, we need to decide what path we want. We will be using `'/hello-world'`

So now our route looks like this:

```ruby
#app.rb

get '/hello-world' do

end
```

3) Now, inside this, we need to tell our applicaiton what template to render and how to render it. We are using erb, so the first thing we type is `erb`:

```ruby
#app.rb

get '/hello-world' do
	erb
end
```

4) Finally, we need to say what template we want to render. If the file lives in our `views` folder, we can refer to the file name as a symbol. For example, we want to use our `hello.erb` template so we can refer to this file as `:hello`, because it lives in our `views` folder.

So now our route looks like this:

```ruby
#app.rb

get '/hello-world' do
	erb :hello
end
```

### Part 4: Run your sinatra app locally

1) Go to the route of your project folder in the terminal. In order to run this app locally, we'll need to install all the dependencies. The list of these dependencies is in our `Gemfile`. To install these, type `bundle install`.

2) Now that we have all of our dependencies installed, we want to run our application. Sinatra runs on rack, so we can run it locally just like our other rack applications: `rackup config.ru`

3) We can now go to `localhost:9292` and see our application. The root path `'/'` will not have anything at it, so you will see the default Sinatra error page. 

4) To see our template rendered, we have to go the path we defined. So visit `localhost:9292/hello-world`

### Part 5: Add static data

1) We can give our app access to data by creating instance variables in our views.

2) Let's make an array of numbers to print out onto the screen. Declare an instance variable called `@random_numbers` and set it to an array of the numbers 1-20.

3) Now that we've put the instance variable in our route, we can access it in the view that that route renders. Let's go into our view and print out our array of numbers.

### Part 6: ERB, embedded ruby

1) In our `hello.erb`, let's print out all the numbers in our `@random_numbers` variable.

2) We want to make a list, so below our "hello world!" let's write a tag for an underordered list:

```ruby
#/views/hello.erb
```
```erb

<ul></ul>
```

3) Now, inside our list, we want to create list items, one for each number in our array. We can do this using `each`.

To set up our each statement, we will use the classic ERB syntax `<% %>`. Our loop will look like this:

```ruby
#/views/hello.erb
```
```erb
<ul>
  <% @random_numbers.each do |number| %>

  <% end %>
</ul>
```

4) We want to make an li for each number, so inside our loop we put an `<li>` tag, like so:

```ruby
#/views/hello.erb
```
```erb
<ul>
  <% @random_numbers.each do |number| %>
    <li></li>
  <% end %>
</ul>
```

5) Lastly, we want each `<li>` tag to have the content of a nubmer from our array, so we need to add some embedded ruby inside our `<li>` tag. We want the number to be printed, so we'll add an `=` to output the value.

```ruby
#/views/hello.erb
```
```erb
<ul>
  <% @random_numbers.each do |number| %>
    <li><%= number %></li>
  <% end %>
</ul>
```

Now, if you restart your server, and then visit `localhost:9292/hello-world` you should see:

![view](http://content.screencast.com/users/ag_dubs/folders/Jing/media/e9b960d9-d549-42e7-8cf9-329250c59c2d/00000038.png)

## Assignment

1. Create a new view called `artists.erb`
2.    Create a route that will render `artists.erb` when a user visits `\artists`
3.    Hardcode some artists and put them in an instance variable
4.    Print out the artists in you `artists.erb` view