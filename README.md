# chef-rookout

## What is a chef-rookout?
A full cookbook for installing Rookout using chef.

**Useful links**:
- The official Rookout [documentation]
- A multiple [deployment-examples]

## Using chef-rookout
1. Clone the repo.
2. After your changes upload the cookbook to your Chef server
```bash
knife cookbook upload rookout-chef
```

### Install Controller

1. Change the API key in `attributes/default.rb`
2. Add the Rookout-controller recipe to run_list:
```ruby
run_list 'foo::bar', 'chef-rookout::controller'
```

### Download Java Rook (javaagent)
1. *optional* Change the rook.jar path in `attributes/default.rb` (default `/etc/rookout/rook.jar`)
2. *optional* Change the Rook version `attributes/default.rb` (default LATEST)
3. Add the java-rook recipe to run_list:
```ruby
run_list 'foo::bar', 'chef-rookout::java-rook'
```
4. Set your JVM to use the rook as a java agent :
```bash
$ export JAVA_OPTIONS="$JAVA_OPTIONS -javaagent:{DOWNLOAD_DIR}/rook.jar"
```

Go to https://app.rookout.com and start debugging :) 

[documentation]: https://docs.rookout.com
[deployment-examples]: https://github.com/Rookout/deployment-examples
