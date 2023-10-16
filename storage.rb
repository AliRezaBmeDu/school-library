require 'json'

# class Storage
#     attr_accessor
#     def store_data
#     end
#     def extract_data
#     end
# end

data_hash = {
    'books' => []
}

data_hash['books'].push('I, Robot')
data_hash['books'][1] = 'The Caves of Steel2'

File.write('./datastorage/sample-data.json', JSON.dump(data_hash))
if File.exist?("./datastorage/sample-data.json")
 file = File.read('./datastorage/sample-data.json')
 data_output = JSON.parse(file)
else
    data_output = nil
end
puts File.exist?("./datastorage/sample-data.json")
puts data_output