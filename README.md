# Saw

As a developer/admin, I saw user coming to registration page, with parameters. I saw user clking on "Connect". 

`What the user might have done?` this is the common question developers do have while debugging any issue, going through logs checking for particular log statement ot request, checking for particular parameters, and then after spending an hour coming with a decision that user must have done this. Saw saves this hour, time spent on debugging and answering this question `What user might have done?`.

This is one more way, one simple way I say, to track what user is doing.

## Installation

Add this line to your application's Gemfile:

    gem 'saw'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install saw

And then install migration and route

    $ rails generate saw install

## Usage

    before_filter :saw

Or

    saw 'viting details page', { :extra => 'something' } 

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

