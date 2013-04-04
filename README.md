# Saw

As a developer/admin, I saw user coming to registration page, with parameters. I saw user clking on "Connect". 

`What the user might have done?` this is a common question developers do have while debugging any issue, going through the logs checking for particular log statement or request param, and then after spending an hour coming with a decision that user must have done this. Saw saves this hour, time spent on debugging and answering this question `What user might have done?`.

This is one more simply way to track what user is doing.

## Installation

Add this line to your application's Gemfile:

    gem 'saw'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install saw

And then install 

    $ rails generate saw install

Next

    $ rake db:migrate

## Usage

    before_filter :saw

Or

    saw 'visiting details page', { :extra => 'something' } 

Or

    # in views
    
    <button id="button-retry" onclick="open_pop_up_form();" class="mybutton medium green">
      Connect to your Device
    </button>
    
    <script type="text/javascript">
      function open_pop_up_form(){
        $.post("/visits", { doing: "clicked on 'Connect to your Device' " } );
        ....
        
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
