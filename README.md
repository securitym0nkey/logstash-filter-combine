# Logstash Combine Filter Plugin

This is a plugin for [Logstash](https://github.com/elastic/logstash).

It is fully free and fully open source. The license is [MIT](LICENSE).


## Documentation
This filter plugin combines multiple source fields into one array.


### Example config

To create an array of source1, source2 and source3 under combine_target

```
filter {
 combine {
  target => "combine_target"
  sources => ["source1","source2", "source3"]
 }
}

```
