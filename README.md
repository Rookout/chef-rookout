# chef-rookout

## What is a chef-rookou?
A full cookbook for installing rookout using chef.

**Useful links**:
- The official rookout [documentation]
- A multiple [deployment-examples]

## Using chef-rookout
1. Clone the repo.
2. After your changes upload the cookbook to your Chef server
```bash
knife cookbook upload rookout
```

### Install Agent

1. Change the API key in `attributes/default.rb`
2. Add the rookout-agent recipe to run_list:
```ruby
run_list 'foo::bar', 'chef-rookout:agent'
```
### Install Agent

1. *optional* Change the rook.jar path in `attributes/default.rb` (default `/etc/rookout/rook.jar`)
2. *optional* Change the Rook version `attributes/default.rb` (default LATEST
3. Add the rookout-agent recipe to run_list:
```ruby
run_list 'foo::bar', 'chef-rookout::java-rook'
```

Go to https://app.rookout.com and start debugging :) 

[documentation]: https://rookout.github.io
[deployment-examples]: https://github.com/Rookout/deployment-examples
