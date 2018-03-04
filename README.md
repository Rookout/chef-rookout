# chef-rookout-agent

## What is a chef-rookout-agent?
A full cookbook for installing rookout-agent using chef.

**Useful links**:
- The official rookout [documentation]
- A multiple [deployment-examples]

## Using chef-rookout-agent

1. Clone the repo.
2. Change the API key in `attributes/default.rb`
3. Upload the cookbook to your Chef server
```bash
knife cookbook upload rookout
```
4. Add the rookout-agent recipe to run_list:
```ruby
run_list 'foo::bar', 'chef-rookout-agent::default'
```
5. Go to https://app.rookout.com and start debugging :) 

[documentation]: https://rookout.github.io
[deployment-examples]: https://github.com/Rookout/deployment-examples
