# FreshchatWhatsapp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/freshchat_whatsapp`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshchat_whatsapp'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install freshchat_whatsapp

### Configuration

Before you can send messages there's some Configuration to be done. Set the base path, api_key

```ruby
 FreshchatWhatsapp.configure do |config|
   config.base_path = "https://example.freshchat.com"
   config.api_key = "api_key"
 end

```

Create an instance of the API client, which is going to be used from now on to interact with whatsapp
```ruby
fresh_chat = FreshchatWhatsapp::Api.new
```


### Send HSM (templated) messages

so freshchat use to give facility to design your template so what ever params you are asking to send into the template you have to prepare as this part is total dynamic by the given method 

this is example template generated you have you change according to your template 
```ruby
def generate_rich_template_data(url, name)
  {
    'rich_template_data' => {
      'button' => {
        'subType' => 'url',
        'params' => [
          {
            'data' => url
          }
        ]
      },
      'body' => {
        'params' => [
          {
            'data' => name
          }
        ]
      }
    }
  }
end
```

prepare params , if we talk about url freshchat will not allow to send you full url you can just sent the part dynamic part.
```ruby
params = generate_rich_template_data('/example/13213', 'MR JACK')
```

This method generates the 'rich_template_data' section for a Freshchat WhatsApp payload.

Parameters:
- `from_number`: is the number regiester to send the number

- `namespace`: Provided by the Freshchat team.
- `to_number`: Recipient's phone number for message delivery.
- `template_name`: Template used for passing data.
- `language`: Default language set to 'en'.
- `params`: Data set using the method above.

```ruby
fresh_chat.send_hsm_message(from_number, to_number, namespace, template_name,language, params)

# output:

{"request_id"=>"48a79993-9b2f", "request_process_time"=>"1", "link"=>{"rel"=>"outbound-messages", "href"=>"/v2/outbound-messages?request_id=48a79993-9b2f", "type"=>"GET"}, "status"=>"Request created successfully. Check delivery status using status API"} 
```

### Check message status

```ruby
fresh_chat.check_message_status('48a79993-9b2f')
{"outbound_messages"=>[{"message_id"=>"0c204f712c2e", "from"=>{"phone_number"=>"+91XXXXXXXX"}, "provider"=>"whatsapp", "to"=>{"phone_number"=>"+91XXXXXXX"}, "data"=>{"message_template"=>{"storage"=>"conversation", "template_name"=>"corporate_sales_client_phone_number_verification_staging", "namespace"=>"e98e3c87a2", "language"=>{"policy"=>"deterministic", "code"=>"en"}, "rich_template_data"=>{"body"=>{"params"=>[{"data"=>"MR JACK"}]}, "button"=>{"subType"=>"url", "params"=>[{"data"=>"/example/13213"}]}}}}, "request_id"=>"6ac508a0d1", "status"=>"READ", "created_on"=>1700193764196}]} 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arvindvyas/freshchat_whatsapp.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
